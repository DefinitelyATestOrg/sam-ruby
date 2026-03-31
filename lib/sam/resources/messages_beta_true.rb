# frozen_string_literal: true

module Sam
  module Resources
    class MessagesBetaTrue
      # Some parameter documentations has been truncated, see
      # {Sam::Models::MessagesBetaTrueCreateParams} for more details.
      #
      # Send a structured list of input messages with text and/or image content, and the
      # model will generate the next message in the conversation.
      #
      # The Messages API can be used for either single queries or stateless multi-turn
      # conversations.
      #
      # Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload create(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, stream: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Sam::Models::MessagesBetaTrueCreateParams::Message>] Body param: Input messages.
      #
      # @param model [String] Body param: The model that will complete your prompt.
      #
      # @param metadata [Sam::Models::MessagesBetaTrueCreateParams::Metadata] Body param: An object describing metadata about the request.
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      #
      # @param stream [Boolean] Body param: Whether to incrementally stream the response using server-sent event
      #
      # @param system_ [String, Array<Sam::Models::MessagesBetaTrueCreateParams::System::UnionMember1>] Body param: System prompt.
      #
      # @param temperature [Float] Body param: Amount of randomness injected into the response.
      #
      # @param thinking [Sam::Models::MessagesBetaTrueCreateParams::Thinking::Enabled, Sam::Models::MessagesBetaTrueCreateParams::Thinking::Disabled] Body param: Configuration for enabling Claude's extended thinking.
      #
      # @param tool_choice [Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::Auto, Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::Any, Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::Tool, Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::None] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTool, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaComputerUseTool20241022, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaBashTool20241022, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTextEditor20241022, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaComputerUseTool20250124, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaBashTool20250124, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTextEditor20250124>] Body param: Definitions of tools that the model may use.
      #
      # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token.
      #
      # @param top_p [Float] Body param: Use nucleus sampling.
      #
      # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use.
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication.
      #
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::MessagesBetaTrueCreateResponse]
      #
      # @see Sam::Models::MessagesBetaTrueCreateParams
      def create(params)
        parsed, options = Sam::MessagesBetaTrueCreateParams.dump_request(params)
        header_params =
          {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/messages?beta=true",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sam::Models::MessagesBetaTrueCreateResponse,
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
