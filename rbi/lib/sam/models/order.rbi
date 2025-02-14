# typed: strong

module Sam
  module Models
    class Order < Sam::BaseModel
      sig { returns(T.nilable(Integer)) }
      def id
      end

      sig { params(_: Integer).returns(Integer) }
      def id=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def complete
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def complete=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def pet_id
      end

      sig { params(_: Integer).returns(Integer) }
      def pet_id=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def quantity
      end

      sig { params(_: Integer).returns(Integer) }
      def quantity=(_)
      end

      sig { returns(T.nilable(Time)) }
      def ship_date
      end

      sig { params(_: Time).returns(Time) }
      def ship_date=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def status
      end

      sig { params(_: Symbol).returns(Symbol) }
      def status=(_)
      end

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
      def initialize(id: nil, complete: nil, pet_id: nil, quantity: nil, ship_date: nil, status: nil)
      end

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
      def to_hash
      end

      class Status < Sam::Enum
        abstract!

        PLACED = :placed
        APPROVED = :approved
        DELIVERED = :delivered

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end
    end
  end
end
