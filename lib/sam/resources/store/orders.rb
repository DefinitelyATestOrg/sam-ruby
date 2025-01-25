# frozen_string_literal: true

module Sam
  module Resources
    class Store
      class Orders
        # For valid response try integer IDs with value <= 5 or > 10. Other values will
        #   generate exceptions.
        #
        # @param order_id [Integer] ID of order that needs to be fetched
        #
        # @param params [Sam::Models::Store::OrderRetrieveParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}] :request_options
        #
        # @return [Sam::Models::Store::CoolOrder]
        #
        def retrieve(order_id, params = {})
          @client.request(
            method: :get,
            path: ["store/order/%0s", order_id],
            model: Sam::Models::Store::CoolOrder,
            options: params[:request_options]
          )
        end

        # For valid response try integer IDs with value < 1000. Anything above 1000 or
        #   nonintegers will generate API errors
        #
        # @param order_id [Integer] ID of the order that needs to be deleted
        #
        # @param params [Sam::Models::Store::OrderDeleteParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}] :request_options
        #
        # @return [nil]
        #
        def delete(order_id, params = {})
          @client.request(
            method: :delete,
            path: ["store/order/%0s", order_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # @param client [Sam::Client]
        #
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
