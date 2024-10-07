# frozen_string_literal: true

module SamRuby
  module Resources
    class Stores
      class Orders
        # @param client [SamRuby::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
