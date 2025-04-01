# frozen_string_literal: true

module Sam
  module Resources
    class Store
      class Orders
        # @api private
        #
        # @param client [Sam::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
