# typed: strong

module Sam
  module Models
    class CompleteCreateParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(Integer) }
      def max_tokens_to_sample
      end

      sig { params(_: Integer).returns(Integer) }
      def max_tokens_to_sample=(_)
      end

      sig { returns(String) }
      def model
      end

      sig { params(_: String).returns(String) }
      def model=(_)
      end

      sig { returns(String) }
      def prompt
      end

      sig { params(_: String).returns(String) }
      def prompt=(_)
      end

      sig { returns(T.nilable(Sam::Models::CompleteCreateParams::Metadata)) }
      def metadata
      end

      sig do
        params(_: Sam::Models::CompleteCreateParams::Metadata).returns(Sam::Models::CompleteCreateParams::Metadata)
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def stop_sequences
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def stop_sequences=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      sig { returns(T.nilable(Float)) }
      def temperature
      end

      sig { params(_: Float).returns(Float) }
      def temperature=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def top_k
      end

      sig { params(_: Integer).returns(Integer) }
      def top_k=(_)
      end

      sig { returns(T.nilable(Float)) }
      def top_p
      end

      sig { params(_: Float).returns(Float) }
      def top_p=(_)
      end

      sig { returns(T.nilable(String)) }
      def anthropic_version
      end

      sig { params(_: String).returns(String) }
      def anthropic_version=(_)
      end

      sig { returns(T.nilable(String)) }
      def x_api_key
      end

      sig { params(_: String).returns(String) }
      def x_api_key=(_)
      end

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
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override
          .returns(
            {
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
              request_options: Sam::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Metadata < Sam::BaseModel
        sig { returns(T.nilable(String)) }
        def user_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def user_id=(_)
        end

        sig { params(user_id: T.nilable(String)).returns(T.attached_class) }
        def self.new(user_id: nil)
        end

        sig { override.returns({user_id: T.nilable(String)}) }
        def to_hash
        end
      end
    end
  end
end
