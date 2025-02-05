# typed: strong

module Sam
  module Resources
    class Store
      class Orders
        sig do
          params(order_id: Integer, request_options: Sam::RequestOpts).returns(Sam::Models::Store::CoolOrder)
        end
        def retrieve(order_id, request_options: {}); end

        sig { params(order_id: Integer, request_options: Sam::RequestOpts).returns(NilClass) }
        def delete(order_id, request_options: {}); end

        sig { params(client: Sam::Client).void }
        def initialize(client:); end
      end
    end
  end
end
