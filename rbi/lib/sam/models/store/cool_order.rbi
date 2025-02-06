# typed: strong

module Sam
  module Models
    module Store
      class CoolOrder < Sam::BaseModel
        sig { returns(T.nilable(Integer)) }
        attr_reader :id

        sig { params(id: Integer).void }
        attr_writer :id

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :complete

        sig { params(complete: T::Boolean).void }
        attr_writer :complete

        sig { returns(T.nilable(Integer)) }
        attr_reader :pet_id

        sig { params(pet_id: Integer).void }
        attr_writer :pet_id

        sig { returns(T.nilable(Integer)) }
        attr_reader :quantity

        sig { params(quantity: Integer).void }
        attr_writer :quantity

        sig { returns(T.nilable(Time)) }
        attr_reader :ship_date

        sig { params(ship_date: Time).void }
        attr_writer :ship_date

        sig { returns(T.nilable(Symbol)) }
        attr_reader :status

        sig { params(status: Symbol).void }
        attr_writer :status

        sig do
          params(
            id: Integer,
            complete: T::Boolean,
            pet_id: Integer,
            quantity: Integer,
            ship_date: Time,
            status: Symbol
          ).void
        end
        def initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil); end

        sig do
          override.returns(
            {
              id: Integer,
              complete: T::Boolean,
              pet_id: Integer,
              quantity: Integer,
              ship_date: Time,
              status: Symbol
            }
          )
        end
        def to_hash; end

        class Status < Sam::Enum
          abstract!

          PLACED = :placed
          APPROVED = :approved
          DELIVERED = :delivered

          sig { override.returns(T::Array[Symbol]) }
          def self.values; end
        end
      end
    end
  end
end
