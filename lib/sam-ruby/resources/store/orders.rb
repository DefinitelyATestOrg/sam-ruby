# frozen_string_literal: true

module SamRuby
  module Resources
    class Store
      class Orders
        def initialize(client:)
          @client = client
        end

        # For valid response try integer IDs with value <= 5 or > 10. Other values will
        #   generate exceptions.
        # 
        # @param order_id [Integer] ID of order that needs to be fetched
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [SamRuby::Models::Order]
        def retrieve(order_id, opts = {})
          req = {}
          req[:method] = :get
          req[:path] = "/store/order/#{order_id}"
          req[:model] = SamRuby::Models::Order
          @client.request(req, opts)
        end

        # For valid response try integer IDs with value < 1000. Anything above 1000 or
        #   nonintegers will generate API errors
        # 
        # @param order_id [Integer] ID of the order that needs to be deleted
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [nil]
        def delete(order_id, opts = {})
          req = {}
          req[:method] = :delete
          req[:path] = "/store/order/#{order_id}"
          req[:model] = NilClass
          @client.request(req, opts)
        end
      end
    end
  end
end
