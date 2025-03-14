# frozen_string_literal: true

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
      #
      # @param params [Sam::Models::CompleteCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Integer] :max_tokens_to_sample Body param: The maximum number of tokens to generate before stopping.
      #
      #     Note that our models may stop _before_ reaching this maximum. This parameter
      #     only specifies the absolute maximum number of tokens to generate.
      #
      #   @option params [String] :model Body param: The model that will complete your prompt.
      #
      #     See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #     details and options.
      #
      #   @option params [String] :prompt Body param: The prompt that you want Claude to complete.
      #
      #     For proper response generation you will need to format your prompt using
      #     alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      #     ```
      #     "\n\nHuman: {userQuestion}\n\nAssistant:"
      #     ```
      #
      #     See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #     our guide to
      #     [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #     details.
      #
      #   @option params [Sam::Models::CompleteCreateParams::Metadata] :metadata Body param: An object describing metadata about the request.
      #
      #   @option params [Array<String>] :stop_sequences Body param: Sequences that will cause the model to stop generating.
      #
      #     Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #     sequences in the future. By providing the stop_sequences parameter, you may
      #     include additional strings that will cause the model to stop generating.
      #
      #   @option params [Boolean] :stream Body param: Whether to incrementally stream the response using server-sent
      #     events.
      #
      #     See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      #
      #   @option params [Float] :temperature Body param: Amount of randomness injected into the response.
      #
      #     Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #     for analytical / multiple choice, and closer to `1.0` for creative and
      #     generative tasks.
      #
      #     Note that even with `temperature` of `0.0`, the results will not be fully
      #     deterministic.
      #
      #   @option params [Integer] :top_k Body param: Only sample from the top K options for each subsequent token.
      #
      #     Used to remove "long tail" low probability responses.
      #     [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [Float] :top_p Body param: Use nucleus sampling.
      #
      #     In nucleus sampling, we compute the cumulative distribution over all the options
      #     for each subsequent token in decreasing probability order and cut it off once it
      #     reaches a particular probability specified by `top_p`. You should either alter
      #     `temperature` or `top_p`, but not both.
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @option params [String] :anthropic_version Header param: The version of the Anthropic API you want to use.
      #
      #     Read more about versioning and our version history
      #     [here](https://docs.anthropic.com/en/api/versioning).
      #
      #   @option params [String] :x_api_key Header param: Your unique API key for authentication.
      #
      #     This key is required in the header of all API requests, to authenticate your
      #     account and access Anthropic's services. Get your API key through the
      #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #     Workspace.
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Sam::Models::CompleteCreateResponse]
      def create(params)
        parsed, options = Sam::Models::CompleteCreateParams.dump_request(params)
        header_params = [:"anthropic-version", :"x-api-key"]
        @client.request(
          method: :post,
          path: "v1/complete",
          headers: parsed.slice(*header_params),
          body: parsed.except(*header_params),
          model: Sam::Models::CompleteCreateResponse,
          options: options
        )
      end

      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
