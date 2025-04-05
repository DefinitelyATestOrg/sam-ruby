# frozen_string_literal: true

module Sam
  module Resources
    class MessagesBetaTrue
      # Send a structured list of input messages with text and/or image content, and the
      #   model will generate the next message in the conversation.
      #
      #   The Messages API can be used for either single queries or stateless multi-turn
      #   conversations.
      #
      #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload create(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, stream: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param max_tokens [Integer]
      # @param messages [Array<Sam::Models::MessagesBetaTrueCreateParams::Message>]
      # @param model [String]
      # @param metadata [Sam::Models::MessagesBetaTrueCreateParams::Metadata]
      # @param stop_sequences [Array<String>]
      # @param stream [Boolean]
      # @param system_ [String, Array<Sam::Models::MessagesBetaTrueCreateParams::System::UnionMember1>]
      # @param temperature [Float]
      # @param thinking [Sam::Models::MessagesBetaTrueCreateParams::Thinking::BetaThinkingConfigEnabled, Sam::Models::MessagesBetaTrueCreateParams::Thinking::BetaThinkingConfigDisabled]
      # @param tool_choice [Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceAuto, Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceAny, Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceTool, Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceNone]
      # @param tools [Array<Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTool, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaComputerUseTool20241022, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaBashTool20241022, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTextEditor20241022, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaComputerUseTool20250124, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaBashTool20250124, Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTextEditor20250124>]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param anthropic_beta [Array<String>]
      # @param anthropic_version [String]
      # @param x_api_key [String]
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::MessagesBetaTrueCreateResponse]
      #
      # @see Sam::Models::MessagesBetaTrueCreateParams
      def create(params)
        parsed, options = Sam::Models::MessagesBetaTrueCreateParams.dump_request(params)
        header_params =
          {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/messages?beta=true",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys).transform_keys(system_: :system),
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
