# frozen_string_literal: true

module SamRuby
  module Resources
    class Stores
      class Orders
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
