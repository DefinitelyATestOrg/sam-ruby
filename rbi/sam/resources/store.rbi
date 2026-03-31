# typed: strong

module Sam
  module Resources
    class Store
      sig { returns(Sam::Resources::Store::Orders) }
      attr_reader :orders

      # @api private
      sig { params(client: Sam::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
