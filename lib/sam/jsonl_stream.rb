# frozen_string_literal: true

module Sam
  # @private
  #
  # @example
  # ```ruby
  # stream.for_each do |event|
  #   puts(event)
  # end
  # ```
  #
  # @example
  # ```ruby
  # events = stream.to_enum.take(2)
  #
  # events => Array
  # ```
  class JsonLStream < Sam::BaseStream
    # @private
    #
    # @return [Enumerable]
    #
    private def iterator
      @iterator ||= Sam::Util.chain_fused(@messages) do |y|
        @messages.each do |line|
          decoded = JSON.parse(line, symbolize_names: true)
          y << Sam::Converter.coerce(@model, decoded)
        end
      end
    end
  end
end
