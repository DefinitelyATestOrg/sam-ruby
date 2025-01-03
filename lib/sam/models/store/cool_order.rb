# frozen_string_literal: true

module Sam
  module Models
    module Store
      class CoolOrder < Sam::BaseModel
        # @!attribute id
        #
        #   @return [Integer]
        optional :id, Integer

        # @!attribute complete
        #
        #   @return [Boolean]
        optional :complete, Sam::BooleanModel

        # @!attribute pet_id
        #
        #   @return [Integer]
        optional :pet_id, Integer, api_name: :petId

        # @!attribute quantity
        #
        #   @return [Integer]
        optional :quantity, Integer

        # @!attribute ship_date
        #
        #   @return [Time]
        optional :ship_date, Time, api_name: :shipDate

        # @!attribute status
        #   Order Status
        #
        #   @return [Symbol, Sam::Models::Store::CoolOrder::Status]
        optional :status, enum: -> { Sam::Models::Store::CoolOrder::Status }

        # @!parse
        #   # @param id [Integer]
        #   #
        #   # @param complete [Boolean]
        #   #
        #   # @param pet_id [Integer]
        #   #
        #   # @param quantity [Integer]
        #   #
        #   # @param ship_date [String]
        #   #
        #   # @param status [String] Order Status
        #   #
        #   def initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil, **) = super

        # def initialize: (Hash | Sam::BaseModel) -> void

        # Order Status
        #
        # @example
        #
        # ```ruby
        # case enum
        # in :placed
        #   # ...
        # in :approved
        #   # ...
        # in :delivered
        #   # ...
        # end
        # ```
        class Status < Sam::Enum
          PLACED = :placed
          APPROVED = :approved
          DELIVERED = :delivered

          finalize!
        end
      end
    end
  end
end
