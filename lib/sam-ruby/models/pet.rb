# frozen_string_literal: true

module SamRuby
  module Models
    class Pet < BaseModel
      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] photo_urls
      #   @return [Array<String>]
      required :photo_urls, SamRuby::ArrayOf.new(String), api_name: :photoUrls

      # @!attribute [rw] id
      #   @return [Integer]
      optional :id, Integer

      # @!attribute [rw] category
      #   @return [SamRuby::Models::Pet::Category]
      optional :category, -> { SamRuby::Models::Pet::Category }

      # @!attribute [rw] status
      #   pet status in the store
      #   @return [Symbol, SamRuby::Models::Pet::Status]
      optional :status, enum: -> { SamRuby::Models::Pet::Status }

      # @!attribute [rw] tags
      #   @return [Array<SamRuby::Models::Pet::Tag>]
      optional :tags, SamRuby::ArrayOf.new(-> { SamRuby::Models::Pet::Tag })

      class Category < BaseModel
        # @!attribute [rw] id
        #   @return [Integer]
        optional :id, Integer

        # @!attribute [rw] name_
        #   @return [String]
        optional :name_, String, api_name: :name

        # @!parse
        #   # Create a new instance of Category from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Integer, nil] :id
        #   #   @option data [String, nil] :name
        #   def initialize(data = {}) = super
      end

      # pet status in the store
      class Status < SamRuby::Enum
        AVAILABLE = :available
        PENDING = :pending
        SOLD = :sold
      end

      class Tag < BaseModel
        # @!attribute [rw] id
        #   @return [Integer]
        optional :id, Integer

        # @!attribute [rw] name_
        #   @return [String]
        optional :name_, String, api_name: :name

        # @!parse
        #   # Create a new instance of Tag from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Integer, nil] :id
        #   #   @option data [String, nil] :name
        #   def initialize(data = {}) = super
      end

      # @!parse
      #   # Create a new instance of Pet from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :name
      #   #   @option data [Array<String>] :photoUrls
      #   #   @option data [Integer, nil] :id
      #   #   @option data [Object, nil] :category
      #   #   @option data [String, nil] :status pet status in the store
      #   #   @option data [Array<Object>, nil] :tags
      #   def initialize(data = {}) = super
    end
  end
end
