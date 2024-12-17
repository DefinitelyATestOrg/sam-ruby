# frozen_string_literal: true

module Sam
  module Models
    module Store
      class CoolOrder < Sam::BaseModel
        # @!attribute [rw] id
        #   @return [Integer]
        optional :id, Integer

        # @!attribute [rw] complete
        #   @return [Boolean]
        optional :complete, Sam::BooleanModel

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
        #   @return [Symbol, Sam::Models::Store::CoolOrder::Status]
        optional :status, enum: -> { Sam::Models::Store::CoolOrder::Status }

        # Order Status
        class Status < Sam::Enum
          PLACED = :placed
          APPROVED = :approved
          DELIVERED = :delivered
        end

        # @!parse
        #   # Create a new instance of CoolOrder from a Hash of raw data.
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
end
