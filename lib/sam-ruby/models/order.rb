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
      #   @return [Symbol]
      optional :status, SamRuby::Enum.new(:placed, :approved, :delivered)
    end
  end
end
