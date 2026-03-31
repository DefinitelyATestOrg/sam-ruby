# frozen_string_literal: true

module Sam
  module Resources
    class SamPlopPlop
      # @api private
      #
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
