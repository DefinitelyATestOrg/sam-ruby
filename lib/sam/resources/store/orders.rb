# frozen_string_literal: true

module Sam
  module Resources
    class Store
      class Orders
        # @param client [Sam::Client]
        def initialize(client:)
          @client = client
        end

        # For valid response try integer IDs with value <= 5 or > 10. Other values will
        #   generate exceptions.
        #
        # @param order_id [Integer] ID of order that needs to be fetched
        #
        # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Sam::Models::Store::CoolOrder]
        def retrieve(order_id, opts = {})
          req = {
            method: :get,
            path: "/store/order/#{order_id}",
            model: Sam::Models::Store::CoolOrder
          }
          @client.request(req, opts)
        end

        # For valid response try integer IDs with value < 1000. Anything above 1000 or
        #   nonintegers will generate API errors
        #
        # @param order_id [Integer] ID of the order that needs to be deleted
        #
        # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [nil]
        def delete(order_id, opts = {})
          req = {
            method: :delete,
            path: "/store/order/#{order_id}",
            model: NilClass
          }
          @client.request(req, opts)
        end
      end
    end
  end
end
