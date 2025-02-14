# typed: strong

module Sam
  module Resources
    class Store
      sig { returns(Sam::Resources::Store::Orders) }
      def orders
      end

      sig { params(client: Sam::Client).void }
      def initialize(client:)
      end
    end
  end
end
