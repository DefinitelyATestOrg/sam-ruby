# typed: strong

module Sam
  module Models
    class MessageCountTokensResponse < Sam::BaseModel
      sig { returns(Integer) }
      def input_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def input_tokens=(_)
      end

      sig { params(input_tokens: Integer).returns(T.attached_class) }
      def self.new(input_tokens:)
      end

      sig { override.returns({input_tokens: Integer}) }
      def to_hash
      end
    end
  end
end
