# typed: strong

module Sam
  module Resources
    class Messages
      sig { returns(Sam::Resources::Messages::Batches) }
      def batches
      end

      sig { returns(Sam::Resources::Messages::BatchesBetaTrue) }
      def batches_beta_true
      end

      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[Sam::Models::MessageCreateParams::Message],
          model: String,
          metadata: Sam::Models::MessageCreateParams::Metadata,
          stop_sequences: T::Array[String],
          stream: T::Boolean,
          system_: T.any(String, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]),
          temperature: Float,
          thinking: T.any(
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled,
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled
          ),
          tool_choice: T.any(
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Sam::Models::MessageCreateParams::Tool::Tool,
            Sam::Models::MessageCreateParams::Tool::BashTool20250124,
            Sam::Models::MessageCreateParams::Tool::TextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          anthropic_beta: T::Array[String],
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::MessageCreateResponse)
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

      sig do
        params(
          messages: T::Array[Sam::Models::MessageCountTokensParams::Message],
          model: String,
          system_: T.any(String, T::Array[Sam::Models::MessageCountTokensParams::System::UnionMember1]),
          thinking: T.any(
            Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled,
            Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigDisabled
          ),
          tool_choice: T.any(
            Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto,
            Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny,
            Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool,
            Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Sam::Models::MessageCountTokensParams::Tool::Tool,
            Sam::Models::MessageCountTokensParams::Tool::BashTool20250124,
            Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124
          )
          ],
          anthropic_beta: T::Array[String],
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::MessageCountTokensResponse)
      end
      def count_tokens(
        messages:,
        model:,
        system_: nil,
        thinking: nil,
        tool_choice: nil,
        tools: nil,
        anthropic_beta: nil,
        anthropic_version: nil,
        x_api_key: nil,
        request_options: {}
      )
      end

      sig do
        params(
          messages: T::Array[Sam::Models::MessageCountTokensBetaParams::Message],
          model: String,
          system_: T.any(String, T::Array[Sam::Models::MessageCountTokensBetaParams::System::UnionMember1]),
          thinking: T.any(
            Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigEnabled,
            Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigDisabled
          ),
          tool_choice: T.any(
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAuto,
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAny,
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceTool,
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
          )
          ],
          anthropic_beta: T::Array[String],
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::MessageCountTokensBetaResponse)
      end
      def count_tokens_beta(
        messages:,
        model:,
        system_: nil,
        thinking: nil,
        tool_choice: nil,
        tools: nil,
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
