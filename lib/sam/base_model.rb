# frozen_string_literal: true

module Sam
  # rubocop:disable Style/CaseEquality

  # @private
  #
  module Converter
    # Based on `target`, transform `value` into `target`, to the extent possible:
    # - If the given `value` conforms to `target` already, return the given `value`.
    # - If it's possible and safe to convert the given `value` to `target`, then the converted value.
    # - Otherwise, the given `value` unaltered.
    #
    # @param target [Class, Sam::Converter]
    # @param value [Object]
    #
    # @return [Object]
    def self.coerce(target, value)
      case target
      in Sam::Converter
        target.coerce(value)
      in Class
        case target
        in -> { _1 <= Sam::Converter }
          target.coerce(value)
        in -> { _1 <= NilClass }
          nil
        in -> { _1 <= Integer }
          value.is_a?(Numeric) ? Integer(value) : value
        in -> { _1 <= Float }
          value.is_a?(Numeric) ? Float(value) : value
        in -> { _1 <= Date || _1 <= Time }
          value.is_a?(String) ? target.parse(value) : value
        in -> { _1 <= String || _1 <= Hash } | -> { _1 == Object }
          value
        end
      end
    end

    # @param target [Class, Sam::Converter]
    # @param value [Object]
    #
    # @return [Object]
    def self.dump(target, value)
      case target
      in Sam::Converter | -> { _1.is_a?(Class) && _1.include?(Sam::Converter) }
        target.dump(value)
      else
        value
      end
    end
  end

  # @private
  #
  # When we don't know what to expect for the value.
  class Unknown
    include Sam::Converter
    # rubocop:disable Lint/UnusedMethodArgument

    # @param other [Object]
    #
    # @return [Boolean]
    def self.===(other) = true

    # @param value [Object]
    #
    # @return [Object]
    def self.coerce(value) = value

    class << self
      alias_method :dump, :coerce
    end

    # rubocop:enable Lint/UnusedMethodArgument
  end

  # @private
  #
  # Ruby has no Boolean class; this is something for models to refer to.
  class BooleanModel
    include Sam::Converter

    # @param other [Object]
    #
    # @return [Boolean]
    def self.===(other) = other == true || other == false

    # @param value [Boolean, Object]
    #
    # @return [Boolean, Object]
    def self.coerce(value) = value

    class << self
      alias_method :dump, :coerce
    end
  end

  # @private
  #
  # A value from among a specified list of options. OpenAPI enum values map to
  # Ruby values in the SDK as follows:
  # boolean => true|false
  # integer => Integer
  # float => Float
  # string => Symbol
  # We can therefore convert string values to Symbols, but can't convert other
  # values safely.
  class Enum
    include Sam::Converter

    # @param other [Object]
    #
    # @return [Boolean]
    def self.===(other) = values.include?(other)

    # @param value [Symbol, String, Object]
    #
    # @return [Symbol, Object]
    def self.coerce(value)
      case value
      in String
        value.to_sym
      else
        value
      end
    end

    class << self
      alias_method :dump, :coerce
    end

    # @return [Array<Symbol>] All of the valid Symbol values for this enum.
    def self.values
      @values ||= constants.map { |c| const_get(c) }
    end
  end

  # @private
  #
  # Array of items of a given type.
  class ArrayOf
    include Sam::Converter

    # @param other [Object]
    #
    # @return [Boolean]
    def ===(other)
      items_type = @items_type_fn.call
      case other
      in Array
        other.all? { |item| items_type === item }
      else
        false
      end
    end

    # @param value [Enumerable, Object]
    #
    # @return [Array<Object>]
    def coerce(value)
      items_type = @items_type_fn.call
      case value
      in Enumerable unless value.is_a?(Hash)
        value.map { |item| Sam::Converter.coerce(items_type, item) }
      else
        value
      end
    end

    # @param value [Enumerable, Object]
    #
    # @return [Array<Object>]
    def dump(value)
      items_type = @items_type_fn.call
      case value
      in Enumerable unless value.is_a?(Hash)
        value.map { |item| Sam::Converter.dump(items_type, item) }.to_a
      else
        value
      end
    end

    # @param item_type [Proc, Object, nil]
    # @param enum [Proc, nil]
    # @param union [Proc, nil]
    def initialize(item_type = nil, enum: nil, union: nil)
      @items_type_fn =
        case [enum, union, item_type]
        in [Proc, nil, nil]
          enum
        in [nil, Proc, nil]
          union
        in [nil, nil, Proc]
          item_type
        in [nil, nil, Class | Sam::Converter]
          -> { item_type }
        end
    end
  end

  # @private
  #
  class BaseModel
    include Sam::Converter

    # @private
    #
    # @param data [Sam::BaseModel, Hash{Symbol => Object}]
    #
    # @return [Hash{Symbol => Object}]
    def self.coerce(value)
      case (coerced = Sam::Util.coerce_hash(value))
      in Hash
        new(coerced)
      else
        value
      end
    end

    # @private
    #
    # @param data [Sam::BaseModel, Hash{Symbol => Object}]
    #
    # @return [Hash{Symbol => Object}]
    def self.dump(value)
      unless (coerced = Sam::Util.coerce_hash(value)).is_a?(Hash)
        return value
      end

      coerced.filter_map do |key, val|
        name = key.to_sym
        case (field = fields[name])
        in nil
          [name, val]
        else
          mode, target_fn, api_name = field.fetch_values(:mode, :type_fn, :key)
          case mode
          in :dump | nil
            target = target_fn.call
            [api_name, Sam::Converter.dump(target, val)]
          else
            next
          end
        end
      end.to_h
    end

    # @private
    #
    # Assumes superclass fields are totally defined before fields are accessed / defined on subclasses.
    #
    # @return [Hash{Symbol => Hash{Symbol => Object}}]
    def self.fields
      @fields ||= (superclass == Sam::BaseModel ? {} : superclass.fields.dup)
    end

    # @private
    #
    # @param name_sym [Symbol]
    # @param required [Boolean]
    # @param api_name [Symbol, nil]
    # @param type_info [Proc, Object]
    #
    # @return [void]
    private_class_method def self.add_field(name_sym, required:, api_name:, type_info:)
      type_fn = type_info.is_a?(Proc) ? type_info : -> { type_info }
      key = api_name || name_sym

      setter = "#{name_sym}="
      if fields.key?(name_sym)
        [name_sym, setter].each { |name| undef_method(name) }
      end
      fields[name_sym] = {mode: @mode, required: required, type_fn: type_fn, key: key}

      define_method(setter) { |val| @data[key] = val }

      define_method(name_sym) do
        field_type = type_fn.call
        Sam::Converter.coerce(field_type, @data[key])
      rescue StandardError
        name = self.class.name.split("::").last
        raise Sam::ConversionError.new(
          "Failed to parse #{name}.#{name_sym} as #{field_type.inspect}. " \
          "To get the unparsed API response, use #{name}[:#{key}]."
        )
      end
    end

    # @private
    #
    # NB `required` is just a signal to the reader. We don't do runtime validation anyway.
    private_class_method def self.required(name_sym, type_info = nil, api_name: nil, enum: nil, union: nil)
      add_field(name_sym, required: true, api_name: api_name, type_info: enum || union || type_info)
    end

    # @private
    #
    # NB `optional` is just a signal to the reader. We don't do runtime validation anyway.
    private_class_method def self.optional(name_sym, type_info = nil, api_name: nil, enum: nil, union: nil)
      add_field(name_sym, required: false, api_name: api_name, type_info: enum || union || type_info)
    end

    # @private
    #
    # `request_only` attributes not excluded from `.#coerce` when receiving responses
    # even if well behaved servers should not send them
    def self.request_only(&blk)
      @mode = :dump
      blk.call
    ensure
      @mode = nil
    end

    # @private
    #
    # `response_only` attributes are omitted from `.#dump` when making requests
    def self.response_only(&blk)
      @mode = :coerce
      blk.call
    ensure
      @mode = nil
    end

    # Create a new instance of a model.
    # @param data [Hash{Symbol => Object}, Sam::BaseModel] Raw data to initialize the model with.
    def initialize(data = {})
      case (coerced = Sam::Util.coerce_hash(data))
      in Hash
        @data = coerced.transform_keys(&:to_sym)
      else
        raise ArgumentError.new("Expected a #{Hash} or #{Sam::BaseModel}, got #{data.inspect}")
      end
    end

    # @param other [Object]
    #
    # @return [Boolean]
    def ==(other)
      case other
      in Sam::BaseModel
        self.class.fields == other.class.fields && @data == other.to_h
      else
        false
      end
    end

    # Returns a Hash of the data underlying this object.
    # Keys are Symbols and values are the raw values from the response.
    # The return value indicates which values were ever set on the object -
    # i.e. there will be a key in this hash if they ever were, even if the
    # set value was nil.
    # This method is not recursive.
    # The returned value is shared by the object, so it should not be mutated.
    #
    # @return [Hash{Symbol => Object}] Data for this object.
    def to_h = @data

    alias_method :to_hash, :to_h

    # Returns the raw value associated with the given key, if found. Otherwise, nil is returned.
    # It is valid to lookup keys that are not in the API spec, for example to access
    # undocumented features.
    # This method does not parse response data into higher-level types.
    # Lookup by anything other than a Symbol is an ArgumentError.
    #
    # @param key [Symbol] Key to look up by.
    #
    # @return [Object, nil] The raw value at the given key.
    def [](key)
      unless key.instance_of?(Symbol)
        raise ArgumentError.new("Expected symbol key for lookup, got #{key.inspect}")
      end

      @data[key]
    end

    # @param keys [Array<Symbol>, nil]
    #
    # @return [Hash{Symbol => Object}]
    def deconstruct_keys(keys)
      (keys || self.class.fields.keys).filter_map do |k|
        unless self.class.fields.key?(k)
          next
        end

        [k, method(k).call]
      end
      .to_h
    end

    # @return [String]
    def inspect
      "#<#{self.class.name}:0x#{object_id.to_s(16)} #{deconstruct_keys(nil).map do |k, v|
        "#{k}=#{v.inspect}"
      end.join(' ')}>"
    end

    # @return [String]
    def to_s = @data.to_s
  end

  # rubocop:enable Style/CaseEquality
end