# typed: strong

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
      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[Sam::Models::MessagesBetaTrueCreateParams::Message],
          model: String,
          metadata: Sam::Models::MessagesBetaTrueCreateParams::Metadata,
          stop_sequences: T::Array[String],
          stream: T::Boolean,
          system_: T.any(String, T::Array[Sam::Models::MessagesBetaTrueCreateParams::System::UnionMember1]),
          temperature: Float,
          thinking: T.any(
            Sam::Models::MessagesBetaTrueCreateParams::Thinking::BetaThinkingConfigEnabled,
            Sam::Models::MessagesBetaTrueCreateParams::Thinking::BetaThinkingConfigDisabled
          ),
          tool_choice: T.any(
            Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceAuto,
            Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceAny,
            Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceTool,
            Sam::Models::MessagesBetaTrueCreateParams::ToolChoice::BetaToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTool,
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaComputerUseTool20241022,
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaBashTool20241022,
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTextEditor20241022,
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaComputerUseTool20250124,
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaBashTool20250124,
            Sam::Models::MessagesBetaTrueCreateParams::Tool::BetaTextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          anthropic_beta: T::Array[String],
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::MessagesBetaTrueCreateResponse)
      end
      def create(
        max_tokens:,
        messages:,
        model:,
        metadata: nil,
        stop_sequences: nil,
        stream: nil,
        system_: nil,
        temperature: nil,
        thinking: nil,
        tool_choice: nil,
        tools: nil,
        top_k: nil,
        top_p: nil,
        anthropic_beta: nil,
        anthropic_version: nil,
        x_api_key: nil,
        request_options: {}
      )
      end

      sig { params(client: Sam::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
