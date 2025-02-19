# typed: strong

module Sam
  module Resources
    class Store
      class Orders
        sig do
          params(
            order_id: Integer,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Order)
        end
        def retrieve(order_id, request_options: {})
        end

        sig do
          params(
            order_id: Integer,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .void
        end
        def delete(order_id, request_options: {})
        end

        sig { params(client: Sam::Client).void }
        def initialize(client:)
        end
      end
    end
  end
end
