# typed: strong

module Sam
  module Resources
    class Store
      sig { returns(Sam::Resources::Store::Orders) }
      attr_reader :orders

      sig { params(client: Sam::Client).void }
      def initialize(client:); end
    end
  end
end
