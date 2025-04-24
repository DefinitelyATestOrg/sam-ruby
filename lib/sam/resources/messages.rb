# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      # @return [Sam::Resources::Messages::Batches]
      attr_reader :batches

      # @return [Sam::Resources::Messages::BatchesBetaTrue]
      attr_reader :batches_beta_true

      # Some parameter documentations has been truncated, see
      # {Sam::Models::MessageCreateParams} for more details.
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
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping. ...
      #
      # @param messages [Array<Sam::Models::MessageCreateParams::Message>] Body param: Input messages. ...
      #
      # @param model [String] Body param: The model that will complete your prompt. ...
      #
      # @param metadata [Sam::Models::MessageCreateParams::Metadata] Body param: An object describing metadata about the request.
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      # ...
      #
      # @param stream [Boolean] Body param: Whether to incrementally stream the response using server-sent event
      # ...
      #
      # @param system_ [String, Array<Sam::Models::MessageCreateParams::System::UnionMember1>] Body param: System prompt. ...
      #
      # @param temperature [Float] Body param: Amount of randomness injected into the response. ...
      #
      # @param thinking [Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled, Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled] Body param: Configuration for enabling Claude's extended thinking. ...
      #
      # @param tool_choice [Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      # ...
      #
      # @param tools [Array<Sam::Models::MessageCreateParams::Tool::Tool, Sam::Models::MessageCreateParams::Tool::BashTool20250124, Sam::Models::MessageCreateParams::Tool::TextEditor20250124>] Body param: Definitions of tools that the model may use. ...
      #
      # @param top_k [Integer] Body param: Only sample from the top K options for each subsequent token. ...
      #
      # @param top_p [Float] Body param: Use nucleus sampling. ...
      #
      # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
      # ...
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use. ...
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication. ...
      #
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::MessageCreateResponse]
      #
      # @see Sam::Models::MessageCreateParams
      def create(params)
        parsed, options = Sam::Models::MessageCreateParams.dump_request(params)
        header_params =
          {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/messages",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sam::Models::MessageCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sam::Models::MessageCountTokensParams} for more details.
      #
      # Count the number of tokens in a Message.
      #
      # The Token Count API can be used to count the number of tokens in a Message,
      # including tools, images, and documents, without creating it.
      #
      # Learn more about token counting in our
      # [user guide](/en/docs/build-with-claude/token-counting)
      #
      # @overload count_tokens(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param messages [Array<Sam::Models::MessageCountTokensParams::Message>] Body param: Input messages. ...
      #
      # @param model [String] Body param: The model that will complete your prompt. ...
      #
      # @param system_ [String, Array<Sam::Models::MessageCountTokensParams::System::UnionMember1>] Body param: System prompt. ...
      #
      # @param thinking [Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled, Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigDisabled] Body param: Configuration for enabling Claude's extended thinking. ...
      #
      # @param tool_choice [Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      # ...
      #
      # @param tools [Array<Sam::Models::MessageCountTokensParams::Tool::Tool, Sam::Models::MessageCountTokensParams::Tool::BashTool20250124, Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124>] Body param: Definitions of tools that the model may use. ...
      #
      # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
      # ...
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use. ...
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication. ...
      #
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::MessageCountTokensResponse]
      #
      # @see Sam::Models::MessageCountTokensParams
      def count_tokens(params)
        parsed, options = Sam::Models::MessageCountTokensParams.dump_request(params)
        header_params =
          {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/messages/count_tokens",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sam::Models::MessageCountTokensResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sam::Models::MessageCountTokensBetaParams} for more details.
      #
      # Count the number of tokens in a Message.
      #
      # The Token Count API can be used to count the number of tokens in a Message,
      # including tools, images, and documents, without creating it.
      #
      # Learn more about token counting in our
      # [user guide](/en/docs/build-with-claude/token-counting)
      #
      # @overload count_tokens_beta(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param messages [Array<Sam::Models::MessageCountTokensBetaParams::Message>] Body param: Input messages. ...
      #
      # @param model [String] Body param: The model that will complete your prompt. ...
      #
      # @param system_ [String, Array<Sam::Models::MessageCountTokensBetaParams::System::UnionMember1>] Body param: System prompt. ...
      #
      # @param thinking [Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigEnabled, Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigDisabled] Body param: Configuration for enabling Claude's extended thinking. ...
      #
      # @param tool_choice [Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAuto, Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAny, Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceTool, Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      # ...
      #
      # @param tools [Array<Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool, Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022, Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022, Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022, Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124, Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124, Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124>] Body param: Definitions of tools that the model may use. ...
      #
      # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
      # ...
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use. ...
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication. ...
      #
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::MessageCountTokensBetaResponse]
      #
      # @see Sam::Models::MessageCountTokensBetaParams
      def count_tokens_beta(params)
        parsed, options = Sam::Models::MessageCountTokensBetaParams.dump_request(params)
        header_params =
          {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
        @client.request(
          method: :post,
          path: "v1/messages/count_tokens?beta=true",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sam::Models::MessageCountTokensBetaResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
        @batches = Sam::Resources::Messages::Batches.new(client: client)
        @batches_beta_true = Sam::Resources::Messages::BatchesBetaTrue.new(client: client)
      end
    end
  end
end
