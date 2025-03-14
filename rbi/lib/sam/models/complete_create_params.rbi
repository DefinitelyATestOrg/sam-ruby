# typed: strong

module Sam
  module Models
    class CompleteCreateParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # The maximum number of tokens to generate before stopping.
      #
      #   Note that our models may stop _before_ reaching this maximum. This parameter
      #   only specifies the absolute maximum number of tokens to generate.
      sig { returns(Integer) }
      def max_tokens_to_sample
      end

      sig { params(_: Integer).returns(Integer) }
      def max_tokens_to_sample=(_)
      end

      # The model that will complete your prompt.
      #
      #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(String) }
      def model
      end

      sig { params(_: String).returns(String) }
      def model=(_)
      end

      # The prompt that you want Claude to complete.
      #
      #   For proper response generation you will need to format your prompt using
      #   alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      #   ```
      #   "\n\nHuman: {userQuestion}\n\nAssistant:"
      #   ```
      #
      #   See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #   our guide to
      #   [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #   details.
      sig { returns(String) }
      def prompt
      end

      sig { params(_: String).returns(String) }
      def prompt=(_)
      end

      # An object describing metadata about the request.
      sig { returns(T.nilable(Sam::Models::CompleteCreateParams::Metadata)) }
      def metadata
      end

      sig do
        params(_: Sam::Models::CompleteCreateParams::Metadata).returns(Sam::Models::CompleteCreateParams::Metadata)
      end
      def metadata=(_)
      end

      # Sequences that will cause the model to stop generating.
      #
      #   Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #   sequences in the future. By providing the stop_sequences parameter, you may
      #   include additional strings that will cause the model to stop generating.
      sig { returns(T.nilable(T::Array[String])) }
      def stop_sequences
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def stop_sequences=(_)
      end

      # Whether to incrementally stream the response using server-sent events.
      #
      #   See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      # Amount of randomness injected into the response.
      #
      #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #   for analytical / multiple choice, and closer to `1.0` for creative and
      #   generative tasks.
      #
      #   Note that even with `temperature` of `0.0`, the results will not be fully
      #   deterministic.
      sig { returns(T.nilable(Float)) }
      def temperature
      end

      sig { params(_: Float).returns(Float) }
      def temperature=(_)
      end

      # Only sample from the top K options for each subsequent token.
      #
      #   Used to remove "long tail" low probability responses.
      #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #   Recommended for advanced use cases only. You usually only need to use
      #   `temperature`.
      sig { returns(T.nilable(Integer)) }
      def top_k
      end

      sig { params(_: Integer).returns(Integer) }
      def top_k=(_)
      end

      # Use nucleus sampling.
      #
      #   In nucleus sampling, we compute the cumulative distribution over all the options
      #   for each subsequent token in decreasing probability order and cut it off once it
      #   reaches a particular probability specified by `top_p`. You should either alter
      #   `temperature` or `top_p`, but not both.
      #
      #   Recommended for advanced use cases only. You usually only need to use
      #   `temperature`.
      sig { returns(T.nilable(Float)) }
      def top_p
      end

      sig { params(_: Float).returns(Float) }
      def top_p=(_)
      end

      # The version of the Anthropic API you want to use.
      #
      #   Read more about versioning and our version history
      #   [here](https://docs.anthropic.com/en/api/versioning).
      sig { returns(T.nilable(String)) }
      def anthropic_version
      end

      sig { params(_: String).returns(String) }
      def anthropic_version=(_)
      end

      # Your unique API key for authentication.
      #
      #   This key is required in the header of all API requests, to authenticate your
      #   account and access Anthropic's services. Get your API key through the
      #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #   Workspace.
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
        # An external identifier for the user who is associated with the request.
        #
        #   This should be a uuid, hash value, or other opaque identifier. Anthropic may use
        #   this id to help detect abuse. Do not include any identifying information such as
        #   name, email address, or phone number.
        sig { returns(T.nilable(String)) }
        def user_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def user_id=(_)
        end

        # An object describing metadata about the request.
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
