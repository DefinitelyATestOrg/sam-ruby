# frozen_string_literal: true

module Sam
  module Resources
    class Store
      # @return [Sam::Resources::Store::Orders]
      attr_reader :orders

      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
        @orders = Sam::Resources::Store::Orders.new(client: client)
      end
    end
  end
end
