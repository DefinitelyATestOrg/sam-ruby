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
      # @overload create(max_tokens_to_sample:, model:, prompt:, metadata: nil, stop_sequences: nil, stream: nil, temperature: nil, top_k: nil, top_p: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param max_tokens_to_sample [Integer]
      # @param model [String]
      # @param prompt [String]
      # @param metadata [Sam::Models::CompleteCreateParams::Metadata]
      # @param stop_sequences [Array<String>]
      # @param stream [Boolean]
      # @param temperature [Float]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param anthropic_version [String]
      # @param x_api_key [String]
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::CompleteCreateResponse]
      #
      # @see Sam::Models::CompleteCreateParams
      def create(params)
        parsed, options = Sam::Models::CompleteCreateParams.dump_request(params)
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
