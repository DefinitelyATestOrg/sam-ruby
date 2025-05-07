# typed: strong

module Sam
  module Models
    class MessageCountTokensBetaResponse < Sam::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

      # The total number of tokens across the provided list of messages, system prompt,
      # and tools.
      sig { returns(Integer) }
      attr_accessor :input_tokens

      sig { params(input_tokens: Integer).returns(T.attached_class) }
      def self.new(
        # The total number of tokens across the provided list of messages, system prompt,
        # and tools.
        input_tokens:
      )
      end

      sig { override.returns({ input_tokens: Integer }) }
      def to_hash
      end
    end
  end
end
