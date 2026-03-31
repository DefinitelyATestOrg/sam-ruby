# frozen_string_literal: true

module Sam
  module Resources
    class User
      # @api private
      #
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
