# frozen_string_literal: true

module Sam
  module Models
    class Order < Sam::BaseModel
      # @!attribute [r] id
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :id

      # @!attribute [r] complete
      #
      #   @return [Boolean, nil]
      optional :complete, Sam::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :complete

      # @!attribute [r] pet_id
      #
      #   @return [Integer, nil]
      optional :pet_id, Integer, api_name: :petId

      # @!parse
      #   # @return [Integer]
      #   attr_writer :pet_id

      # @!attribute [r] quantity
      #
      #   @return [Integer, nil]
      optional :quantity, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :quantity

      # @!attribute [r] ship_date
      #
      #   @return [Time, nil]
      optional :ship_date, Time, api_name: :shipDate

      # @!parse
      #   # @return [Time]
      #   attr_writer :ship_date

      # @!attribute [r] status
      #   Order Status
      #
      #   @return [Symbol, Sam::Models::Order::Status, nil]
      optional :status, enum: -> { Sam::Models::Order::Status }

      # @!parse
      #   # @return [Symbol, Sam::Models::Order::Status]
      #   attr_writer :status

      # @!parse
      #   # @param id [Integer]
      #   # @param complete [Boolean]
      #   # @param pet_id [Integer]
      #   # @param quantity [Integer]
      #   # @param ship_date [Time]
      #   # @param status [Symbol, Sam::Models::Order::Status]
      #   #
      #   def initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil, **) = super

      # def initialize: (Hash | Sam::BaseModel) -> void

      # @abstract
      #
      # Order Status
      #
      # @example
      # ```ruby
      # case status
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

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
