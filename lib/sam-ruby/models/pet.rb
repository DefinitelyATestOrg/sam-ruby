# frozen_string_literal: true

module SamRuby
  module Models
    class Pet < BaseModel
      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] photo_urls
      #   @return [Array<String>]
      required :photo_urls, SamRuby::ArrayOf.new(String)

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
        optional :name_, String

        # Create a new instance of Category from a Hash of raw data.
        #
        # @overload initialize(id: nil, name: nil)
        # @param id [Integer]
        # @param name [String]
        def initialize(data = {})
          super
        end
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
        optional :name_, String

        # Create a new instance of Tag from a Hash of raw data.
        #
        # @overload initialize(id: nil, name: nil)
        # @param id [Integer]
        # @param name [String]
        def initialize(data = {})
          super
        end
      end

      # Create a new instance of Pet from a Hash of raw data.
      #
      # @overload initialize(name: nil, photoUrls: nil, id: nil, category: nil, status: nil, tags: nil)
      # @param name [String]
      # @param photoUrls [Array<String>]
      # @param id [Integer]
      # @param category [Object]
      # @param status [String] pet status in the store
      # @param tags [Array<Object>]
      def initialize(data = {})
        super
      end
    end
  end
end
