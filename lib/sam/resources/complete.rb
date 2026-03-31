# frozen_string_literal: true

module Sam
  module Resources
    class Complete
      # Some parameter documentations has been truncated, see
      # {Sam::Models::CompleteCreateParams} for more details.
      #
      # [Legacy] Create a Text Completion.
      #
      # The Text Completions API is a legacy API. We recommend using the
      # [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      # Future models and features will not be compatible with Text Completions. See our
      # [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      # for guidance in migrating from Text Completions to Messages.
      #
      # @overload create(max_tokens_to_sample:, model:, prompt:, metadata: nil, stop_sequences: nil, stream: nil, temperature: nil, top_k: nil, top_p: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param max_tokens_to_sample [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param model [String] Body param: The model that will complete your prompt.
      #
      # @param prompt [String] Body param: The prompt that you want Claude to complete.
      #
      # @param metadata [Sam::Models::CompleteCreateParams::Metadata] Body param: An object describing metadata about the request.
      #
      # @param stop_sequences [Array<String>] Body param: Sequences that will cause the model to stop generating.
      #
      # @param stream [Boolean] Body param: Whether to incrementally stream the response using server-sent event
      #
      # @param temperature [Float] Body param: Amount of randomness injected into the response.
      #
      # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Body param: Use nucleus sampling.
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use.
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication.
      #
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::CompleteCreateResponse]
      #
      # @see Sam::Models::CompleteCreateParams
      def create(params)
        parsed, options = Sam::CompleteCreateParams.dump_request(params)
        header_params = {anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/complete",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sam::Models::CompleteCreateResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
