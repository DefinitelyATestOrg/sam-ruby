# frozen_string_literal: true

module SamRuby
  module Resources
    class Stores
      # @return [SamRuby::Resources::Stores::Orders]
      attr_reader :orders

      def initialize(client:)
        @client = client
        @orders = SamRuby::Resources::Stores::Orders.new(client: client)
      end

      # For valid response try integer IDs with value <= 5 or > 10. Other values will
      #   generate exceptions.
      #
      # @param order_id [Integer] ID of order that needs to be fetched
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::Order]
      def retrieve(order_id, opts = {})
        req = {
          method: :get,
          path: "/store/order/#{order_id}",
          model: SamRuby::Models::Order
        }
        @client.request(req, opts)
      end

      # For valid response try integer IDs with value < 1000. Anything above 1000 or
      #   nonintegers will generate API errors
      #
      # @param order_id [Integer] ID of the order that needs to be deleted
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
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

      # Place a new order in the store
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Integer, nil] :id
      # @option params [Boolean, nil] :complete
      # @option params [Integer, nil] :pet_id
      # @option params [Integer, nil] :quantity
      # @option params [Time, nil] :ship_date
      # @option params [Symbol, Status, nil] :status Order Status
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::Order]
      def create_order(params = {}, opts = {})
        req = {
          method: :post,
          path: "/store/order",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: SamRuby::Models::Order
        }
        @client.request(req, opts)
      end

      # Returns a map of status codes to quantities
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Hash]
      def inventory(opts = {})
        req = {
          method: :get,
          path: "/store/inventory",
          model: Hash
        }
        @client.request(req, opts)
      end
    end
  end
end
