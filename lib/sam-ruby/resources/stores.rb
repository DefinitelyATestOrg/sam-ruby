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

      # Place a new order in the store
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Integer] :id
      # @option params [Boolean] :complete
      # @option params [Integer] :pet_id
      # @option params [Integer] :quantity
      # @option params [DateTime] :ship_date
      # @option params [Symbol] :status Order Status
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::Order]
      def create_order(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/store/order"
        req[:body] = params
        req[:model] = SamRuby::Models::Order
        @client.request(req, opts)
      end

      # Returns a map of status codes to quantities
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Hash]
      def inventory(opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/store/inventory"
        req[:model] = Hash
        @client.request(req, opts)
      end
    end
  end
end
