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
      #   One of the constants defined in {SamRuby::Models::Pet::Status}
      #   @return [Symbol]
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
      end
    end
  end
end
