# frozen_string_literal: true

module SamRuby
  module Resources
    class Store
      # @return [SamRuby::Resources::Store::Orders]
      attr_reader :orders

      def initialize(client:)
        @client = client
        @orders = SamRuby::Resources::Store::Orders.new(client: client)
      end
    end
  end
end
