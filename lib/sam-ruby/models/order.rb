# frozen_string_literal: true

module SamRuby
  module Models
    class Order < BaseModel
      # @!attribute [rw] id
      #   @return [Integer]
      optional :id, Integer

      # @!attribute [rw] complete
      #   @return [Boolean]
      optional :complete, SamRuby::BooleanModel

      # @!attribute [rw] pet_id
      #   @return [Integer]
      optional :pet_id, Integer

      # @!attribute [rw] quantity
      #   @return [Integer]
      optional :quantity, Integer

      # @!attribute [rw] ship_date
      #   @return [String]
      optional :ship_date, String

      # @!attribute [rw] status
      #   Order Status
      #   One of the constants defined in {SamRuby::Models::Order::Status}
      #   @return [Symbol]
      optional :status, enum: -> { SamRuby::Models::Order::Status }

      # Order Status
      class Status < SamRuby::Enum
        PLACED = :placed
        APPROVED = :approved
        DELIVERED = :delivered
      end
    end
  end
end
