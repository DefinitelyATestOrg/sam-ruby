# typed: strong

module Sam
  module Resources
    class Complete
      sig do
        params(
          max_tokens_to_sample: Integer,
          model: String,
          prompt: String,
          metadata: Sam::Models::CompleteCreateParams::Metadata,
          stop_sequences: T::Array[String],
          stream: T::Boolean,
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::CompleteCreateResponse)
      end
      def create(
        max_tokens_to_sample:,
        model:,
        prompt:,
        metadata: nil,
        stop_sequences: nil,
        stream: nil,
        temperature: nil,
        top_k: nil,
        top_p: nil,
        anthropic_version: nil,
        x_api_key: nil,
        request_options: {}
      )
      end

      sig { params(client: Sam::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
