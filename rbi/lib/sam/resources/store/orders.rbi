# typed: strong

module Sam
  module Resources
    class Store
      class Orders
        sig { params(client: Sam::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
