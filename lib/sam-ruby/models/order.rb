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
      optional :pet_id, Integer, api_name: :petId

      # @!attribute [rw] quantity
      #   @return [Integer]
      optional :quantity, Integer

      # @!attribute [rw] ship_date
      #   @return [Time]
      optional :ship_date, Time, api_name: :shipDate

      # @!attribute [rw] status
      #   Order Status
      #   @return [Symbol, SamRuby::Models::Order::Status]
      optional :status, enum: -> { SamRuby::Models::Order::Status }

      # Order Status
      class Status < SamRuby::Enum
        PLACED = :placed
        APPROVED = :approved
        DELIVERED = :delivered
      end

      # @!parse
      #   # Create a new instance of Order from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer, nil] :id
      #   #   @option data [Hash, nil] :complete
      #   #   @option data [Integer, nil] :petId
      #   #   @option data [Integer, nil] :quantity
      #   #   @option data [String, nil] :shipDate
      #   #   @option data [String, nil] :status Order Status
      #   def initialize(data = {}) = super
    end
  end
end
