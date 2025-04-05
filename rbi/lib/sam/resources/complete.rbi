# typed: strong

module Sam
  module Resources
    class Complete
      # [Legacy] Create a Text Completion.
      #
      #   The Text Completions API is a legacy API. We recommend using the
      #   [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      #   Future models and features will not be compatible with Text Completions. See our
      #   [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      #   for guidance in migrating from Text Completions to Messages.
      sig do
        params(
          max_tokens_to_sample: Integer,
          model: String,
          prompt: String,
          metadata: T.any(Sam::Models::CompleteCreateParams::Metadata, Sam::Internal::AnyHash),
          stop_sequences: T::Array[String],
          stream: T::Boolean,
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, Sam::Internal::AnyHash))
        )
          .returns(Sam::Models::CompleteCreateResponse)
      end
      def create(
        # Body param: The maximum number of tokens to generate before stopping.
        #
        #   Note that our models may stop _before_ reaching this maximum. This parameter
        #   only specifies the absolute maximum number of tokens to generate.
        max_tokens_to_sample:,
        # Body param: The model that will complete your prompt.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        model:,
        # Body param: The prompt that you want Claude to complete.
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
        prompt:,
        # Body param: An object describing metadata about the request.
        metadata: nil,
        # Body param: Sequences that will cause the model to stop generating.
        #
        #   Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
        #   sequences in the future. By providing the stop_sequences parameter, you may
        #   include additional strings that will cause the model to stop generating.
        stop_sequences: nil,
        # Body param: Whether to incrementally stream the response using server-sent
        #   events.
        #
        #   See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
        stream: nil,
        # Body param: Amount of randomness injected into the response.
        #
        #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
        #   for analytical / multiple choice, and closer to `1.0` for creative and
        #   generative tasks.
        #
        #   Note that even with `temperature` of `0.0`, the results will not be fully
        #   deterministic.
        temperature: nil,
        # Body param: Only sample from the top K options for each subsequent token.
        #
        #   Used to remove "long tail" low probability responses.
        #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        top_k: nil,
        # Body param: Use nucleus sampling.
        #
        #   In nucleus sampling, we compute the cumulative distribution over all the options
        #   for each subsequent token in decreasing probability order and cut it off once it
        #   reaches a particular probability specified by `top_p`. You should either alter
        #   `temperature` or `top_p`, but not both.
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        top_p: nil,
        # Header param: The version of the Anthropic API you want to use.
        #
        #   Read more about versioning and our version history
        #   [here](https://docs.anthropic.com/en/api/versioning).
        anthropic_version: nil,
        # Header param: Your unique API key for authentication.
        #
        #   This key is required in the header of all API requests, to authenticate your
        #   account and access Anthropic's services. Get your API key through the
        #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #   Workspace.
        x_api_key: nil,
        request_options: {}
      ); end
      # @api private
      sig { params(client: Sam::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
