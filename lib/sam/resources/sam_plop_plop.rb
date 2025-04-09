# frozen_string_literal: true

module Sam
  module Resources
    class SamPlopPlop
      # Send a structured list of input messages with text and/or image content, and the
      # model will generate the next message in the conversation.
      #
      # The Messages API can be used for either single queries or stateless multi-turn
      # conversations.
      #
      # Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      #
      # @overload create_message(max_tokens:, messages:, model:, metadata: nil, stop_sequences: nil, stream: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param max_tokens [Integer]
      # @param messages [Array<Sam::Models::SamPlopPlopCreateMessageParams::Message>]
      # @param model [String]
      # @param metadata [Sam::Models::SamPlopPlopCreateMessageParams::Metadata]
      # @param stop_sequences [Array<String>]
      # @param stream [Boolean]
      # @param system_ [String, Array<Sam::Models::SamPlopPlopCreateMessageParams::System::UnionMember1>]
      # @param temperature [Float]
      # @param thinking [Sam::Models::SamPlopPlopCreateMessageParams::Thinking::ThinkingConfigEnabled, Sam::Models::SamPlopPlopCreateMessageParams::Thinking::ThinkingConfigDisabled]
      # @param tool_choice [Sam::Models::SamPlopPlopCreateMessageParams::ToolChoice::ToolChoiceAuto, Sam::Models::SamPlopPlopCreateMessageParams::ToolChoice::ToolChoiceAny, Sam::Models::SamPlopPlopCreateMessageParams::ToolChoice::ToolChoiceTool, Sam::Models::SamPlopPlopCreateMessageParams::ToolChoice::ToolChoiceNone]
      # @param tools [Array<Sam::Models::SamPlopPlopCreateMessageParams::Tool::Tool, Sam::Models::SamPlopPlopCreateMessageParams::Tool::BashTool20250124, Sam::Models::SamPlopPlopCreateMessageParams::Tool::TextEditor20250124>]
      # @param top_k [Integer]
      # @param top_p [Float]
      # @param anthropic_beta [Array<String>]
      # @param anthropic_version [String]
      # @param x_api_key [String]
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::SamPlopPlopCreateMessageResponse]
      #
      # @see Sam::Models::SamPlopPlopCreateMessageParams
      def create_message(params)
        parsed, options = Sam::Models::SamPlopPlopCreateMessageParams.dump_request(params)
        header_params =
          {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/sam-plop-plop",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sam::Models::SamPlopPlopCreateMessageResponse,
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
