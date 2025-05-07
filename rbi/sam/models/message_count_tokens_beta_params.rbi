# typed: strong

module Sam
  module Models
    class MessageCountTokensBetaParams < Sam::Internal::Type::BaseModel
      extend Sam::Internal::Type::RequestParameters::Converter
      include Sam::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

      # Input messages.
      #
      # Our models are trained to operate on alternating `user` and `assistant`
      # conversational turns. When creating a new `Message`, you specify the prior
      # conversational turns with the `messages` parameter, and the model then generates
      # the next `Message` in the conversation. Consecutive `user` or `assistant` turns
      # in your request will be combined into a single turn.
      #
      # Each input message must be an object with a `role` and `content`. You can
      # specify a single `user`-role message, or you can include multiple `user` and
      # `assistant` messages.
      #
      # If the final message uses the `assistant` role, the response content will
      # continue immediately from the content in that message. This can be used to
      # constrain part of the model's response.
      #
      # Example with a single `user` message:
      #
      # ```json
      # [{ "role": "user", "content": "Hello, Claude" }]
      # ```
      #
      # Example with multiple conversational turns:
      #
      # ```json
      # [
      #   { "role": "user", "content": "Hello there." },
      #   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
      #   { "role": "user", "content": "Can you explain LLMs in plain English?" }
      # ]
      # ```
      #
      # Example with a partially-filled response from Claude:
      #
      # ```json
      # [
      #   {
      #     "role": "user",
      #     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
      #   },
      #   { "role": "assistant", "content": "The best answer is (" }
      # ]
      # ```
      #
      # Each input message `content` may be either a single `string` or an array of
      # content blocks, where each block has a specific `type`. Using a `string` for
      # `content` is shorthand for an array of one content block of type `"text"`. The
      # following input messages are equivalent:
      #
      # ```json
      # { "role": "user", "content": "Hello, Claude" }
      # ```
      #
      # ```json
      # { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
      # ```
      #
      # Starting with Claude 3 models, you can also send image content blocks:
      #
      # ```json
      # {
      #   "role": "user",
      #   "content": [
      #     {
      #       "type": "image",
      #       "source": {
      #         "type": "base64",
      #         "media_type": "image/jpeg",
      #         "data": "/9j/4AAQSkZJRg..."
      #       }
      #     },
      #     { "type": "text", "text": "What is in this image?" }
      #   ]
      # }
      # ```
      #
      # We currently support the `base64` source type for images, and the `image/jpeg`,
      # `image/png`, `image/gif`, and `image/webp` media types.
      #
      # See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
      # more input examples.
      #
      # Note that if you want to include a
      # [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
      # the top-level `system` parameter — there is no `"system"` role for input
      # messages in the Messages API.
      sig { returns(T::Array[Sam::MessageCountTokensBetaParams::Message]) }
      attr_accessor :messages

      # The model that will complete your prompt.
      #
      # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      # details and options.
      sig { returns(String) }
      attr_accessor :model

      # System prompt.
      #
      # A system prompt is a way of providing context and instructions to Claude, such
      # as specifying a particular goal or role. See our
      # [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      sig do
        returns(
          T.nilable(
            T.any(
              String,
              T::Array[Sam::MessageCountTokensBetaParams::System::UnionMember1]
            )
          )
        )
      end
      attr_reader :system_

      sig do
        params(
          system_:
            T.any(
              String,
              T::Array[
                Sam::MessageCountTokensBetaParams::System::UnionMember1::OrHash
              ]
            )
        ).void
      end
      attr_writer :system_

      # Configuration for enabling Claude's extended thinking.
      #
      # When enabled, responses include `thinking` content blocks showing Claude's
      # thinking process before the final answer. Requires a minimum budget of 1,024
      # tokens and counts towards your `max_tokens` limit.
      #
      # See
      # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      # for details.
      sig do
        returns(
          T.nilable(
            T.any(
              Sam::MessageCountTokensBetaParams::Thinking::Enabled,
              Sam::MessageCountTokensBetaParams::Thinking::Disabled
            )
          )
        )
      end
      attr_reader :thinking

      sig do
        params(
          thinking:
            T.any(
              Sam::MessageCountTokensBetaParams::Thinking::Enabled::OrHash,
              Sam::MessageCountTokensBetaParams::Thinking::Disabled::OrHash
            )
        ).void
      end
      attr_writer :thinking

      # How the model should use the provided tools. The model can use a specific tool,
      # any available tool, decide by itself, or not use tools at all.
      sig do
        returns(
          T.nilable(
            T.any(
              Sam::MessageCountTokensBetaParams::ToolChoice::Auto,
              Sam::MessageCountTokensBetaParams::ToolChoice::Any,
              Sam::MessageCountTokensBetaParams::ToolChoice::Tool,
              Sam::MessageCountTokensBetaParams::ToolChoice::None
            )
          )
        )
      end
      attr_reader :tool_choice

      sig do
        params(
          tool_choice:
            T.any(
              Sam::MessageCountTokensBetaParams::ToolChoice::Auto::OrHash,
              Sam::MessageCountTokensBetaParams::ToolChoice::Any::OrHash,
              Sam::MessageCountTokensBetaParams::ToolChoice::Tool::OrHash,
              Sam::MessageCountTokensBetaParams::ToolChoice::None::OrHash
            )
        ).void
      end
      attr_writer :tool_choice

      # Definitions of tools that the model may use.
      #
      # If you include `tools` in your API request, the model may return `tool_use`
      # content blocks that represent the model's use of those tools. You can then run
      # those tools using the tool input generated by the model and then optionally
      # return results back to the model using `tool_result` content blocks.
      #
      # Each tool definition includes:
      #
      # - `name`: Name of the tool.
      # - `description`: Optional, but strongly-recommended description of the tool.
      # - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
      #   tool `input` shape that the model will produce in `tool_use` output content
      #   blocks.
      #
      # For example, if you defined `tools` as:
      #
      # ```json
      # [
      #   {
      #     "name": "get_stock_price",
      #     "description": "Get the current stock price for a given ticker symbol.",
      #     "input_schema": {
      #       "type": "object",
      #       "properties": {
      #         "ticker": {
      #           "type": "string",
      #           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
      #         }
      #       },
      #       "required": ["ticker"]
      #     }
      #   }
      # ]
      # ```
      #
      # And then asked the model "What's the S&P 500 at today?", the model might produce
      # `tool_use` content blocks in the response like this:
      #
      # ```json
      # [
      #   {
      #     "type": "tool_use",
      #     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
      #     "name": "get_stock_price",
      #     "input": { "ticker": "^GSPC" }
      #   }
      # ]
      # ```
      #
      # You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
      # input, and return the following back to the model in a subsequent `user`
      # message:
      #
      # ```json
      # [
      #   {
      #     "type": "tool_result",
      #     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
      #     "content": "259.75 USD"
      #   }
      # ]
      # ```
      #
      # Tools can be used for workflows that include running client-side tools and
      # functions, or more generally whenever you want the model to produce a particular
      # JSON structure of output.
      #
      # See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                Sam::MessageCountTokensBetaParams::Tool::BetaTool,
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
              )
            ]
          )
        )
      end
      attr_reader :tools

      sig do
        params(
          tools:
            T::Array[
              T.any(
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::OrHash
              )
            ]
        ).void
      end
      attr_writer :tools

      # Optional header to specify the beta version(s) you want to use.
      #
      # To use multiple betas, use a comma separated list like `beta1,beta2` or specify
      # the header multiple times for each beta.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :anthropic_beta

      sig { params(anthropic_beta: T::Array[String]).void }
      attr_writer :anthropic_beta

      # The version of the Anthropic API you want to use.
      #
      # Read more about versioning and our version history
      # [here](https://docs.anthropic.com/en/api/versioning).
      sig { returns(T.nilable(String)) }
      attr_reader :anthropic_version

      sig { params(anthropic_version: String).void }
      attr_writer :anthropic_version

      # Your unique API key for authentication.
      #
      # This key is required in the header of all API requests, to authenticate your
      # account and access Anthropic's services. Get your API key through the
      # [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      # Workspace.
      sig { returns(T.nilable(String)) }
      attr_reader :x_api_key

      sig { params(x_api_key: String).void }
      attr_writer :x_api_key

      sig do
        params(
          messages:
            T::Array[Sam::MessageCountTokensBetaParams::Message::OrHash],
          model: String,
          system_:
            T.any(
              String,
              T::Array[
                Sam::MessageCountTokensBetaParams::System::UnionMember1::OrHash
              ]
            ),
          thinking:
            T.any(
              Sam::MessageCountTokensBetaParams::Thinking::Enabled::OrHash,
              Sam::MessageCountTokensBetaParams::Thinking::Disabled::OrHash
            ),
          tool_choice:
            T.any(
              Sam::MessageCountTokensBetaParams::ToolChoice::Auto::OrHash,
              Sam::MessageCountTokensBetaParams::ToolChoice::Any::OrHash,
              Sam::MessageCountTokensBetaParams::ToolChoice::Tool::OrHash,
              Sam::MessageCountTokensBetaParams::ToolChoice::None::OrHash
            ),
          tools:
            T::Array[
              T.any(
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::OrHash,
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::OrHash
              )
            ],
          anthropic_beta: T::Array[String],
          anthropic_version: String,
          x_api_key: String,
          request_options: Sam::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Input messages.
        #
        # Our models are trained to operate on alternating `user` and `assistant`
        # conversational turns. When creating a new `Message`, you specify the prior
        # conversational turns with the `messages` parameter, and the model then generates
        # the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        # in your request will be combined into a single turn.
        #
        # Each input message must be an object with a `role` and `content`. You can
        # specify a single `user`-role message, or you can include multiple `user` and
        # `assistant` messages.
        #
        # If the final message uses the `assistant` role, the response content will
        # continue immediately from the content in that message. This can be used to
        # constrain part of the model's response.
        #
        # Example with a single `user` message:
        #
        # ```json
        # [{ "role": "user", "content": "Hello, Claude" }]
        # ```
        #
        # Example with multiple conversational turns:
        #
        # ```json
        # [
        #   { "role": "user", "content": "Hello there." },
        #   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #   { "role": "user", "content": "Can you explain LLMs in plain English?" }
        # ]
        # ```
        #
        # Example with a partially-filled response from Claude:
        #
        # ```json
        # [
        #   {
        #     "role": "user",
        #     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
        #   },
        #   { "role": "assistant", "content": "The best answer is (" }
        # ]
        # ```
        #
        # Each input message `content` may be either a single `string` or an array of
        # content blocks, where each block has a specific `type`. Using a `string` for
        # `content` is shorthand for an array of one content block of type `"text"`. The
        # following input messages are equivalent:
        #
        # ```json
        # { "role": "user", "content": "Hello, Claude" }
        # ```
        #
        # ```json
        # { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        # ```
        #
        # Starting with Claude 3 models, you can also send image content blocks:
        #
        # ```json
        # {
        #   "role": "user",
        #   "content": [
        #     {
        #       "type": "image",
        #       "source": {
        #         "type": "base64",
        #         "media_type": "image/jpeg",
        #         "data": "/9j/4AAQSkZJRg..."
        #       }
        #     },
        #     { "type": "text", "text": "What is in this image?" }
        #   ]
        # }
        # ```
        #
        # We currently support the `base64` source type for images, and the `image/jpeg`,
        # `image/png`, `image/gif`, and `image/webp` media types.
        #
        # See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
        # more input examples.
        #
        # Note that if you want to include a
        # [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
        # the top-level `system` parameter — there is no `"system"` role for input
        # messages in the Messages API.
        messages:,
        # The model that will complete your prompt.
        #
        # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        model:,
        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such
        # as specifying a particular goal or role. See our
        # [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        system_: nil,
        # Configuration for enabling Claude's extended thinking.
        #
        # When enabled, responses include `thinking` content blocks showing Claude's
        # thinking process before the final answer. Requires a minimum budget of 1,024
        # tokens and counts towards your `max_tokens` limit.
        #
        # See
        # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        # for details.
        thinking: nil,
        # How the model should use the provided tools. The model can use a specific tool,
        # any available tool, decide by itself, or not use tools at all.
        tool_choice: nil,
        # Definitions of tools that the model may use.
        #
        # If you include `tools` in your API request, the model may return `tool_use`
        # content blocks that represent the model's use of those tools. You can then run
        # those tools using the tool input generated by the model and then optionally
        # return results back to the model using `tool_result` content blocks.
        #
        # Each tool definition includes:
        #
        # - `name`: Name of the tool.
        # - `description`: Optional, but strongly-recommended description of the tool.
        # - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
        #   tool `input` shape that the model will produce in `tool_use` output content
        #   blocks.
        #
        # For example, if you defined `tools` as:
        #
        # ```json
        # [
        #   {
        #     "name": "get_stock_price",
        #     "description": "Get the current stock price for a given ticker symbol.",
        #     "input_schema": {
        #       "type": "object",
        #       "properties": {
        #         "ticker": {
        #           "type": "string",
        #           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #         }
        #       },
        #       "required": ["ticker"]
        #     }
        #   }
        # ]
        # ```
        #
        # And then asked the model "What's the S&P 500 at today?", the model might produce
        # `tool_use` content blocks in the response like this:
        #
        # ```json
        # [
        #   {
        #     "type": "tool_use",
        #     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #     "name": "get_stock_price",
        #     "input": { "ticker": "^GSPC" }
        #   }
        # ]
        # ```
        #
        # You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        # input, and return the following back to the model in a subsequent `user`
        # message:
        #
        # ```json
        # [
        #   {
        #     "type": "tool_result",
        #     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #     "content": "259.75 USD"
        #   }
        # ]
        # ```
        #
        # Tools can be used for workflows that include running client-side tools and
        # functions, or more generally whenever you want the model to produce a particular
        # JSON structure of output.
        #
        # See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        tools: nil,
        # Optional header to specify the beta version(s) you want to use.
        #
        # To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        # the header multiple times for each beta.
        anthropic_beta: nil,
        # The version of the Anthropic API you want to use.
        #
        # Read more about versioning and our version history
        # [here](https://docs.anthropic.com/en/api/versioning).
        anthropic_version: nil,
        # Your unique API key for authentication.
        #
        # This key is required in the header of all API requests, to authenticate your
        # account and access Anthropic's services. Get your API key through the
        # [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        # Workspace.
        x_api_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            messages: T::Array[Sam::MessageCountTokensBetaParams::Message],
            model: String,
            system_:
              T.any(
                String,
                T::Array[
                  Sam::MessageCountTokensBetaParams::System::UnionMember1
                ]
              ),
            thinking:
              T.any(
                Sam::MessageCountTokensBetaParams::Thinking::Enabled,
                Sam::MessageCountTokensBetaParams::Thinking::Disabled
              ),
            tool_choice:
              T.any(
                Sam::MessageCountTokensBetaParams::ToolChoice::Auto,
                Sam::MessageCountTokensBetaParams::ToolChoice::Any,
                Sam::MessageCountTokensBetaParams::ToolChoice::Tool,
                Sam::MessageCountTokensBetaParams::ToolChoice::None
              ),
            tools:
              T::Array[
                T.any(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool,
                  Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
                  Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
                  Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
                  Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
                  Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
                  Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
                )
              ],
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: Sam::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Message < Sam::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

        sig do
          returns(
            T.any(
              String,
              T::Array[
                T.any(
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Thinking,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::RedactedThinking
                )
              ]
            )
          )
        end
        attr_accessor :content

        sig do
          returns(Sam::MessageCountTokensBetaParams::Message::Role::OrSymbol)
        end
        attr_accessor :role

        sig do
          params(
            content:
              T.any(
                String,
                T::Array[
                  T.any(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::OrHash,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::OrHash,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse::OrHash,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::OrHash,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::OrHash,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Thinking::OrHash,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::RedactedThinking::OrHash
                  )
                ]
              ),
            role: Sam::MessageCountTokensBetaParams::Message::Role::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(content:, role:)
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  String,
                  T::Array[
                    T.any(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Thinking,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::RedactedThinking
                    )
                  ]
                ),
              role: Sam::MessageCountTokensBetaParams::Message::Role::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Content
          extend Sam::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[
                  T.any(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Thinking,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::RedactedThinking
                  )
                ]
              )
            end

          module UnionMember1
            extend Sam::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Thinking,
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::RedactedThinking
                )
              end

            class Text < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :text

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::CacheControl::OrHash
                    )
                ).void
              end
              attr_writer :cache_control

              sig do
                returns(
                  T.nilable(
                    T::Array[
                      T.any(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::CharLocation,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::PageLocation,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::ContentBlockLocation
                      )
                    ]
                  )
                )
              end
              attr_accessor :citations

              sig do
                params(
                  text: String,
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::CacheControl::OrHash
                    ),
                  citations:
                    T.nilable(
                      T::Array[
                        T.any(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::CharLocation::OrHash,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::PageLocation::OrHash,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::ContentBlockLocation::OrHash
                        )
                      ]
                    ),
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                text:,
                cache_control: nil,
                citations: nil,
                type: :text
              )
              end

              sig do
                override.returns(
                  {
                    text: String,
                    type: Symbol,
                    cache_control:
                      T.nilable(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::CacheControl
                      ),
                    citations:
                      T.nilable(
                        T::Array[
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::CharLocation,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::PageLocation,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::ContentBlockLocation
                          )
                        ]
                      )
                  }
                )
              end
              def to_hash
              end

              class CacheControl < Sam::Internal::Type::BaseModel
                OrHash =
                  T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                sig { returns(Symbol) }
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({ type: Symbol }) }
                def to_hash
                end
              end

              module Citation
                extend Sam::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::CharLocation,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::PageLocation,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::ContentBlockLocation
                    )
                  end

                class CharLocation < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(String) }
                  attr_accessor :cited_text

                  sig { returns(Integer) }
                  attr_accessor :document_index

                  sig { returns(T.nilable(String)) }
                  attr_accessor :document_title

                  sig { returns(Integer) }
                  attr_accessor :end_char_index

                  sig { returns(Integer) }
                  attr_accessor :start_char_index

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      cited_text: String,
                      document_index: Integer,
                      document_title: T.nilable(String),
                      end_char_index: Integer,
                      start_char_index: Integer,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    cited_text:,
                    document_index:,
                    document_title:,
                    end_char_index:,
                    start_char_index:,
                    type: :char_location
                  )
                  end

                  sig do
                    override.returns(
                      {
                        cited_text: String,
                        document_index: Integer,
                        document_title: T.nilable(String),
                        end_char_index: Integer,
                        start_char_index: Integer,
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end
                end

                class PageLocation < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(String) }
                  attr_accessor :cited_text

                  sig { returns(Integer) }
                  attr_accessor :document_index

                  sig { returns(T.nilable(String)) }
                  attr_accessor :document_title

                  sig { returns(Integer) }
                  attr_accessor :end_page_number

                  sig { returns(Integer) }
                  attr_accessor :start_page_number

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      cited_text: String,
                      document_index: Integer,
                      document_title: T.nilable(String),
                      end_page_number: Integer,
                      start_page_number: Integer,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    cited_text:,
                    document_index:,
                    document_title:,
                    end_page_number:,
                    start_page_number:,
                    type: :page_location
                  )
                  end

                  sig do
                    override.returns(
                      {
                        cited_text: String,
                        document_index: Integer,
                        document_title: T.nilable(String),
                        end_page_number: Integer,
                        start_page_number: Integer,
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end
                end

                class ContentBlockLocation < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(String) }
                  attr_accessor :cited_text

                  sig { returns(Integer) }
                  attr_accessor :document_index

                  sig { returns(T.nilable(String)) }
                  attr_accessor :document_title

                  sig { returns(Integer) }
                  attr_accessor :end_block_index

                  sig { returns(Integer) }
                  attr_accessor :start_block_index

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      cited_text: String,
                      document_index: Integer,
                      document_title: T.nilable(String),
                      end_block_index: Integer,
                      start_block_index: Integer,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    cited_text:,
                    document_index:,
                    document_title:,
                    end_block_index:,
                    start_block_index:,
                    type: :content_block_location
                  )
                  end

                  sig do
                    override.returns(
                      {
                        cited_text: String,
                        document_index: Integer,
                        document_title: T.nilable(String),
                        end_block_index: Integer,
                        start_block_index: Integer,
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Text::Citation::Variants
                    ]
                  )
                end
                def self.variants
                end
              end
            end

            class Image < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig do
                returns(
                  T.any(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::URL
                  )
                )
              end
              attr_accessor :source

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::CacheControl::OrHash
                    )
                ).void
              end
              attr_writer :cache_control

              sig do
                params(
                  source:
                    T.any(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::OrHash,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::URL::OrHash
                    ),
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::CacheControl::OrHash
                    ),
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(source:, cache_control: nil, type: :image)
              end

              sig do
                override.returns(
                  {
                    source:
                      T.any(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::URL
                      ),
                    type: Symbol,
                    cache_control:
                      T.nilable(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::CacheControl
                      )
                  }
                )
              end
              def to_hash
              end

              module Source
                extend Sam::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::URL
                    )
                  end

                class Base64 < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(String) }
                  attr_accessor :data

                  sig do
                    returns(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol
                    )
                  end
                  attr_accessor :media_type

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      data: String,
                      media_type:
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(data:, media_type:, type: :base64)
                  end

                  sig do
                    override.returns(
                      {
                        data: String,
                        media_type:
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol,
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end

                  module MediaType
                    extend Sam::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    IMAGE_JPEG =
                      T.let(
                        :"image/jpeg",
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                      )
                    IMAGE_PNG =
                      T.let(
                        :"image/png",
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                      )
                    IMAGE_GIF =
                      T.let(
                        :"image/gif",
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                      )
                    IMAGE_WEBP =
                      T.let(
                        :"image/webp",
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                class URL < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig { returns(String) }
                  attr_accessor :url

                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(url:, type: :url)
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Image::Source::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class CacheControl < Sam::Internal::Type::BaseModel
                OrHash =
                  T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                sig { returns(Symbol) }
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({ type: Symbol }) }
                def to_hash
                end
              end
            end

            class ToolUse < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :id

              sig { returns(T.anything) }
              attr_accessor :input

              sig { returns(String) }
              attr_accessor :name

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse::CacheControl::OrHash
                    )
                ).void
              end
              attr_writer :cache_control

              sig do
                params(
                  id: String,
                  input: T.anything,
                  name: String,
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse::CacheControl::OrHash
                    ),
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                id:,
                input:,
                name:,
                cache_control: nil,
                type: :tool_use
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    input: T.anything,
                    name: String,
                    type: Symbol,
                    cache_control:
                      T.nilable(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolUse::CacheControl
                      )
                  }
                )
              end
              def to_hash
              end

              class CacheControl < Sam::Internal::Type::BaseModel
                OrHash =
                  T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                sig { returns(Symbol) }
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({ type: Symbol }) }
                def to_hash
                end
              end
            end

            class ToolResult < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :tool_use_id

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::CacheControl::OrHash
                    )
                ).void
              end
              attr_writer :cache_control

              sig do
                returns(
                  T.nilable(
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image
                        )
                      ]
                    )
                  )
                )
              end
              attr_reader :content

              sig do
                params(
                  content:
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::OrHash,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::OrHash
                        )
                      ]
                    )
                ).void
              end
              attr_writer :content

              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_error

              sig { params(is_error: T::Boolean).void }
              attr_writer :is_error

              sig do
                params(
                  tool_use_id: String,
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::CacheControl::OrHash
                    ),
                  content:
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::OrHash,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::OrHash
                        )
                      ]
                    ),
                  is_error: T::Boolean,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                tool_use_id:,
                cache_control: nil,
                content: nil,
                is_error: nil,
                type: :tool_result
              )
              end

              sig do
                override.returns(
                  {
                    tool_use_id: String,
                    type: Symbol,
                    cache_control:
                      T.nilable(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::CacheControl
                      ),
                    content:
                      T.any(
                        String,
                        T::Array[
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image
                          )
                        ]
                      ),
                    is_error: T::Boolean
                  }
                )
              end
              def to_hash
              end

              class CacheControl < Sam::Internal::Type::BaseModel
                OrHash =
                  T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                sig { returns(Symbol) }
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({ type: Symbol }) }
                def to_hash
                end
              end

              module Content
                extend Sam::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image
                        )
                      ]
                    )
                  end

                module UnionMember1
                  extend Sam::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image
                      )
                    end

                  class Text < Sam::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(T.self_type, Sam::Internal::AnyHash)
                      end

                    sig { returns(String) }
                    attr_accessor :text

                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      returns(
                        T.nilable(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::CacheControl
                        )
                      )
                    end
                    attr_reader :cache_control

                    sig do
                      params(
                        cache_control:
                          T.nilable(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::CacheControl::OrHash
                          )
                      ).void
                    end
                    attr_writer :cache_control

                    sig do
                      returns(
                        T.nilable(
                          T::Array[
                            T.any(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::CharLocation,
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::PageLocation,
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::ContentBlockLocation
                            )
                          ]
                        )
                      )
                    end
                    attr_accessor :citations

                    sig do
                      params(
                        text: String,
                        cache_control:
                          T.nilable(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::CacheControl::OrHash
                          ),
                        citations:
                          T.nilable(
                            T::Array[
                              T.any(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::CharLocation::OrHash,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::PageLocation::OrHash,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::ContentBlockLocation::OrHash
                              )
                            ]
                          ),
                        type: Symbol
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      text:,
                      cache_control: nil,
                      citations: nil,
                      type: :text
                    )
                    end

                    sig do
                      override.returns(
                        {
                          text: String,
                          type: Symbol,
                          cache_control:
                            T.nilable(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::CacheControl
                            ),
                          citations:
                            T.nilable(
                              T::Array[
                                T.any(
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::CharLocation,
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::PageLocation,
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::ContentBlockLocation
                                )
                              ]
                            )
                        }
                      )
                    end
                    def to_hash
                    end

                    class CacheControl < Sam::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(T.self_type, Sam::Internal::AnyHash)
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      sig { params(type: Symbol).returns(T.attached_class) }
                      def self.new(type: :ephemeral)
                      end

                      sig { override.returns({ type: Symbol }) }
                      def to_hash
                      end
                    end

                    module Citation
                      extend Sam::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::CharLocation,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::PageLocation,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::ContentBlockLocation
                          )
                        end

                      class CharLocation < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig { returns(String) }
                        attr_accessor :cited_text

                        sig { returns(Integer) }
                        attr_accessor :document_index

                        sig { returns(T.nilable(String)) }
                        attr_accessor :document_title

                        sig { returns(Integer) }
                        attr_accessor :end_char_index

                        sig { returns(Integer) }
                        attr_accessor :start_char_index

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          params(
                            cited_text: String,
                            document_index: Integer,
                            document_title: T.nilable(String),
                            end_char_index: Integer,
                            start_char_index: Integer,
                            type: Symbol
                          ).returns(T.attached_class)
                        end
                        def self.new(
                          cited_text:,
                          document_index:,
                          document_title:,
                          end_char_index:,
                          start_char_index:,
                          type: :char_location
                        )
                        end

                        sig do
                          override.returns(
                            {
                              cited_text: String,
                              document_index: Integer,
                              document_title: T.nilable(String),
                              end_char_index: Integer,
                              start_char_index: Integer,
                              type: Symbol
                            }
                          )
                        end
                        def to_hash
                        end
                      end

                      class PageLocation < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig { returns(String) }
                        attr_accessor :cited_text

                        sig { returns(Integer) }
                        attr_accessor :document_index

                        sig { returns(T.nilable(String)) }
                        attr_accessor :document_title

                        sig { returns(Integer) }
                        attr_accessor :end_page_number

                        sig { returns(Integer) }
                        attr_accessor :start_page_number

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          params(
                            cited_text: String,
                            document_index: Integer,
                            document_title: T.nilable(String),
                            end_page_number: Integer,
                            start_page_number: Integer,
                            type: Symbol
                          ).returns(T.attached_class)
                        end
                        def self.new(
                          cited_text:,
                          document_index:,
                          document_title:,
                          end_page_number:,
                          start_page_number:,
                          type: :page_location
                        )
                        end

                        sig do
                          override.returns(
                            {
                              cited_text: String,
                              document_index: Integer,
                              document_title: T.nilable(String),
                              end_page_number: Integer,
                              start_page_number: Integer,
                              type: Symbol
                            }
                          )
                        end
                        def to_hash
                        end
                      end

                      class ContentBlockLocation < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig { returns(String) }
                        attr_accessor :cited_text

                        sig { returns(Integer) }
                        attr_accessor :document_index

                        sig { returns(T.nilable(String)) }
                        attr_accessor :document_title

                        sig { returns(Integer) }
                        attr_accessor :end_block_index

                        sig { returns(Integer) }
                        attr_accessor :start_block_index

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          params(
                            cited_text: String,
                            document_index: Integer,
                            document_title: T.nilable(String),
                            end_block_index: Integer,
                            start_block_index: Integer,
                            type: Symbol
                          ).returns(T.attached_class)
                        end
                        def self.new(
                          cited_text:,
                          document_index:,
                          document_title:,
                          end_block_index:,
                          start_block_index:,
                          type: :content_block_location
                        )
                        end

                        sig do
                          override.returns(
                            {
                              cited_text: String,
                              document_index: Integer,
                              document_title: T.nilable(String),
                              end_block_index: Integer,
                              start_block_index: Integer,
                              type: Symbol
                            }
                          )
                        end
                        def to_hash
                        end
                      end

                      sig do
                        override.returns(
                          T::Array[
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Text::Citation::Variants
                          ]
                        )
                      end
                      def self.variants
                      end
                    end
                  end

                  class Image < Sam::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(T.self_type, Sam::Internal::AnyHash)
                      end

                    sig do
                      returns(
                        T.any(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64,
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::URL
                        )
                      )
                    end
                    attr_accessor :source

                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      returns(
                        T.nilable(
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::CacheControl
                        )
                      )
                    end
                    attr_reader :cache_control

                    sig do
                      params(
                        cache_control:
                          T.nilable(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::CacheControl::OrHash
                          )
                      ).void
                    end
                    attr_writer :cache_control

                    sig do
                      params(
                        source:
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::OrHash,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::URL::OrHash
                          ),
                        cache_control:
                          T.nilable(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::CacheControl::OrHash
                          ),
                        type: Symbol
                      ).returns(T.attached_class)
                    end
                    def self.new(source:, cache_control: nil, type: :image)
                    end

                    sig do
                      override.returns(
                        {
                          source:
                            T.any(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64,
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::URL
                            ),
                          type: Symbol,
                          cache_control:
                            T.nilable(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::CacheControl
                            )
                        }
                      )
                    end
                    def to_hash
                    end

                    module Source
                      extend Sam::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::URL
                          )
                        end

                      class Base64 < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig { returns(String) }
                        attr_accessor :data

                        sig do
                          returns(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol
                          )
                        end
                        attr_accessor :media_type

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          params(
                            data: String,
                            media_type:
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol,
                            type: Symbol
                          ).returns(T.attached_class)
                        end
                        def self.new(data:, media_type:, type: :base64)
                        end

                        sig do
                          override.returns(
                            {
                              data: String,
                              media_type:
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol,
                              type: Symbol
                            }
                          )
                        end
                        def to_hash
                        end

                        module MediaType
                          extend Sam::Internal::Type::Enum

                          TaggedSymbol =
                            T.type_alias do
                              T.all(
                                Symbol,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType
                              )
                            end
                          OrSymbol = T.type_alias { T.any(Symbol, String) }

                          IMAGE_JPEG =
                            T.let(
                              :"image/jpeg",
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                            )
                          IMAGE_PNG =
                            T.let(
                              :"image/png",
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                            )
                          IMAGE_GIF =
                            T.let(
                              :"image/gif",
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                            )
                          IMAGE_WEBP =
                            T.let(
                              :"image/webp",
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                            )

                          sig do
                            override.returns(
                              T::Array[
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                              ]
                            )
                          end
                          def self.values
                          end
                        end
                      end

                      class URL < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig { returns(String) }
                        attr_accessor :url

                        sig do
                          params(url: String, type: Symbol).returns(
                            T.attached_class
                          )
                        end
                        def self.new(url:, type: :url)
                        end

                        sig { override.returns({ type: Symbol, url: String }) }
                        def to_hash
                        end
                      end

                      sig do
                        override.returns(
                          T::Array[
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Image::Source::Variants
                          ]
                        )
                      end
                      def self.variants
                      end
                    end

                    class CacheControl < Sam::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(T.self_type, Sam::Internal::AnyHash)
                        end

                      sig { returns(Symbol) }
                      attr_accessor :type

                      sig { params(type: Symbol).returns(T.attached_class) }
                      def self.new(type: :ephemeral)
                      end

                      sig { override.returns({ type: Symbol }) }
                      def to_hash
                      end
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember1Array =
                  T.let(
                    Sam::Internal::Type::ArrayOf[
                      union:
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::ToolResult::Content::UnionMember1
                    ],
                    Sam::Internal::Type::Converter
                  )
              end
            end

            class Document < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig do
                returns(
                  T.any(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Base64,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Text,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content,
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::URL
                  )
                )
              end
              attr_accessor :source

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::CacheControl::OrHash
                    )
                ).void
              end
              attr_writer :cache_control

              sig do
                returns(
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Citations
                  )
                )
              end
              attr_reader :citations

              sig do
                params(
                  citations:
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Citations::OrHash
                ).void
              end
              attr_writer :citations

              sig { returns(T.nilable(String)) }
              attr_accessor :context

              sig { returns(T.nilable(String)) }
              attr_accessor :title

              sig do
                params(
                  source:
                    T.any(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Base64::OrHash,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Text::OrHash,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::OrHash,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::URL::OrHash
                    ),
                  cache_control:
                    T.nilable(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::CacheControl::OrHash
                    ),
                  citations:
                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Citations::OrHash,
                  context: T.nilable(String),
                  title: T.nilable(String),
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                source:,
                cache_control: nil,
                citations: nil,
                context: nil,
                title: nil,
                type: :document
              )
              end

              sig do
                override.returns(
                  {
                    source:
                      T.any(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Base64,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Text,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content,
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::URL
                      ),
                    type: Symbol,
                    cache_control:
                      T.nilable(
                        Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::CacheControl
                      ),
                    citations:
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Citations,
                    context: T.nilable(String),
                    title: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              module Source
                extend Sam::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Base64,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Text,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content,
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::URL
                    )
                  end

                class Base64 < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(String) }
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :media_type

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      data: String,
                      media_type: Symbol,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    data:,
                    media_type: :"application/pdf",
                    type: :base64
                  )
                  end

                  sig do
                    override.returns(
                      { data: String, media_type: Symbol, type: Symbol }
                    )
                  end
                  def to_hash
                  end
                end

                class Text < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(String) }
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :media_type

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      data: String,
                      media_type: Symbol,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(data:, media_type: :"text/plain", type: :text)
                  end

                  sig do
                    override.returns(
                      { data: String, media_type: Symbol, type: Symbol }
                    )
                  end
                  def to_hash
                  end
                end

                class Content < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig do
                    returns(
                      T.any(
                        String,
                        T::Array[
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image
                          )
                        ]
                      )
                    )
                  end
                  attr_accessor :content

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      content:
                        T.any(
                          String,
                          T::Array[
                            T.any(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::OrHash,
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::OrHash
                            )
                          ]
                        ),
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(content:, type: :content)
                  end

                  sig do
                    override.returns(
                      {
                        content:
                          T.any(
                            String,
                            T::Array[
                              T.any(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image
                              )
                            ]
                          ),
                        type: Symbol
                      }
                    )
                  end
                  def to_hash
                  end

                  module Content
                    extend Sam::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          String,
                          T::Array[
                            T.any(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text,
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image
                            )
                          ]
                        )
                      end

                    module UnionMember1
                      extend Sam::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text,
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image
                          )
                        end

                      class Text < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig { returns(String) }
                        attr_accessor :text

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          returns(
                            T.nilable(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::CacheControl
                            )
                          )
                        end
                        attr_reader :cache_control

                        sig do
                          params(
                            cache_control:
                              T.nilable(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::CacheControl::OrHash
                              )
                          ).void
                        end
                        attr_writer :cache_control

                        sig do
                          returns(
                            T.nilable(
                              T::Array[
                                T.any(
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::CharLocation,
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::PageLocation,
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::ContentBlockLocation
                                )
                              ]
                            )
                          )
                        end
                        attr_accessor :citations

                        sig do
                          params(
                            text: String,
                            cache_control:
                              T.nilable(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::CacheControl::OrHash
                              ),
                            citations:
                              T.nilable(
                                T::Array[
                                  T.any(
                                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::CharLocation::OrHash,
                                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::PageLocation::OrHash,
                                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::ContentBlockLocation::OrHash
                                  )
                                ]
                              ),
                            type: Symbol
                          ).returns(T.attached_class)
                        end
                        def self.new(
                          text:,
                          cache_control: nil,
                          citations: nil,
                          type: :text
                        )
                        end

                        sig do
                          override.returns(
                            {
                              text: String,
                              type: Symbol,
                              cache_control:
                                T.nilable(
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::CacheControl
                                ),
                              citations:
                                T.nilable(
                                  T::Array[
                                    T.any(
                                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::CharLocation,
                                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::PageLocation,
                                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::ContentBlockLocation
                                    )
                                  ]
                                )
                            }
                          )
                        end
                        def to_hash
                        end

                        class CacheControl < Sam::Internal::Type::BaseModel
                          OrHash =
                            T.type_alias do
                              T.any(T.self_type, Sam::Internal::AnyHash)
                            end

                          sig { returns(Symbol) }
                          attr_accessor :type

                          sig { params(type: Symbol).returns(T.attached_class) }
                          def self.new(type: :ephemeral)
                          end

                          sig { override.returns({ type: Symbol }) }
                          def to_hash
                          end
                        end

                        module Citation
                          extend Sam::Internal::Type::Union

                          Variants =
                            T.type_alias do
                              T.any(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::CharLocation,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::PageLocation,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::ContentBlockLocation
                              )
                            end

                          class CharLocation < Sam::Internal::Type::BaseModel
                            OrHash =
                              T.type_alias do
                                T.any(T.self_type, Sam::Internal::AnyHash)
                              end

                            sig { returns(String) }
                            attr_accessor :cited_text

                            sig { returns(Integer) }
                            attr_accessor :document_index

                            sig { returns(T.nilable(String)) }
                            attr_accessor :document_title

                            sig { returns(Integer) }
                            attr_accessor :end_char_index

                            sig { returns(Integer) }
                            attr_accessor :start_char_index

                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig do
                              params(
                                cited_text: String,
                                document_index: Integer,
                                document_title: T.nilable(String),
                                end_char_index: Integer,
                                start_char_index: Integer,
                                type: Symbol
                              ).returns(T.attached_class)
                            end
                            def self.new(
                              cited_text:,
                              document_index:,
                              document_title:,
                              end_char_index:,
                              start_char_index:,
                              type: :char_location
                            )
                            end

                            sig do
                              override.returns(
                                {
                                  cited_text: String,
                                  document_index: Integer,
                                  document_title: T.nilable(String),
                                  end_char_index: Integer,
                                  start_char_index: Integer,
                                  type: Symbol
                                }
                              )
                            end
                            def to_hash
                            end
                          end

                          class PageLocation < Sam::Internal::Type::BaseModel
                            OrHash =
                              T.type_alias do
                                T.any(T.self_type, Sam::Internal::AnyHash)
                              end

                            sig { returns(String) }
                            attr_accessor :cited_text

                            sig { returns(Integer) }
                            attr_accessor :document_index

                            sig { returns(T.nilable(String)) }
                            attr_accessor :document_title

                            sig { returns(Integer) }
                            attr_accessor :end_page_number

                            sig { returns(Integer) }
                            attr_accessor :start_page_number

                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig do
                              params(
                                cited_text: String,
                                document_index: Integer,
                                document_title: T.nilable(String),
                                end_page_number: Integer,
                                start_page_number: Integer,
                                type: Symbol
                              ).returns(T.attached_class)
                            end
                            def self.new(
                              cited_text:,
                              document_index:,
                              document_title:,
                              end_page_number:,
                              start_page_number:,
                              type: :page_location
                            )
                            end

                            sig do
                              override.returns(
                                {
                                  cited_text: String,
                                  document_index: Integer,
                                  document_title: T.nilable(String),
                                  end_page_number: Integer,
                                  start_page_number: Integer,
                                  type: Symbol
                                }
                              )
                            end
                            def to_hash
                            end
                          end

                          class ContentBlockLocation < Sam::Internal::Type::BaseModel
                            OrHash =
                              T.type_alias do
                                T.any(T.self_type, Sam::Internal::AnyHash)
                              end

                            sig { returns(String) }
                            attr_accessor :cited_text

                            sig { returns(Integer) }
                            attr_accessor :document_index

                            sig { returns(T.nilable(String)) }
                            attr_accessor :document_title

                            sig { returns(Integer) }
                            attr_accessor :end_block_index

                            sig { returns(Integer) }
                            attr_accessor :start_block_index

                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig do
                              params(
                                cited_text: String,
                                document_index: Integer,
                                document_title: T.nilable(String),
                                end_block_index: Integer,
                                start_block_index: Integer,
                                type: Symbol
                              ).returns(T.attached_class)
                            end
                            def self.new(
                              cited_text:,
                              document_index:,
                              document_title:,
                              end_block_index:,
                              start_block_index:,
                              type: :content_block_location
                            )
                            end

                            sig do
                              override.returns(
                                {
                                  cited_text: String,
                                  document_index: Integer,
                                  document_title: T.nilable(String),
                                  end_block_index: Integer,
                                  start_block_index: Integer,
                                  type: Symbol
                                }
                              )
                            end
                            def to_hash
                            end
                          end

                          sig do
                            override.returns(
                              T::Array[
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Text::Citation::Variants
                              ]
                            )
                          end
                          def self.variants
                          end
                        end
                      end

                      class Image < Sam::Internal::Type::BaseModel
                        OrHash =
                          T.type_alias do
                            T.any(T.self_type, Sam::Internal::AnyHash)
                          end

                        sig do
                          returns(
                            T.any(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64,
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::URL
                            )
                          )
                        end
                        attr_accessor :source

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          returns(
                            T.nilable(
                              Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::CacheControl
                            )
                          )
                        end
                        attr_reader :cache_control

                        sig do
                          params(
                            cache_control:
                              T.nilable(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::CacheControl::OrHash
                              )
                          ).void
                        end
                        attr_writer :cache_control

                        sig do
                          params(
                            source:
                              T.any(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::OrHash,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::URL::OrHash
                              ),
                            cache_control:
                              T.nilable(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::CacheControl::OrHash
                              ),
                            type: Symbol
                          ).returns(T.attached_class)
                        end
                        def self.new(source:, cache_control: nil, type: :image)
                        end

                        sig do
                          override.returns(
                            {
                              source:
                                T.any(
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64,
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::URL
                                ),
                              type: Symbol,
                              cache_control:
                                T.nilable(
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::CacheControl
                                )
                            }
                          )
                        end
                        def to_hash
                        end

                        module Source
                          extend Sam::Internal::Type::Union

                          Variants =
                            T.type_alias do
                              T.any(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64,
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::URL
                              )
                            end

                          class Base64 < Sam::Internal::Type::BaseModel
                            OrHash =
                              T.type_alias do
                                T.any(T.self_type, Sam::Internal::AnyHash)
                              end

                            sig { returns(String) }
                            attr_accessor :data

                            sig do
                              returns(
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol
                              )
                            end
                            attr_accessor :media_type

                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig do
                              params(
                                data: String,
                                media_type:
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol,
                                type: Symbol
                              ).returns(T.attached_class)
                            end
                            def self.new(data:, media_type:, type: :base64)
                            end

                            sig do
                              override.returns(
                                {
                                  data: String,
                                  media_type:
                                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::OrSymbol,
                                  type: Symbol
                                }
                              )
                            end
                            def to_hash
                            end

                            module MediaType
                              extend Sam::Internal::Type::Enum

                              TaggedSymbol =
                                T.type_alias do
                                  T.all(
                                    Symbol,
                                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType
                                  )
                                end
                              OrSymbol = T.type_alias { T.any(Symbol, String) }

                              IMAGE_JPEG =
                                T.let(
                                  :"image/jpeg",
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                                )
                              IMAGE_PNG =
                                T.let(
                                  :"image/png",
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                                )
                              IMAGE_GIF =
                                T.let(
                                  :"image/gif",
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                                )
                              IMAGE_WEBP =
                                T.let(
                                  :"image/webp",
                                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                                )

                              sig do
                                override.returns(
                                  T::Array[
                                    Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Base64::MediaType::TaggedSymbol
                                  ]
                                )
                              end
                              def self.values
                              end
                            end
                          end

                          class URL < Sam::Internal::Type::BaseModel
                            OrHash =
                              T.type_alias do
                                T.any(T.self_type, Sam::Internal::AnyHash)
                              end

                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig { returns(String) }
                            attr_accessor :url

                            sig do
                              params(url: String, type: Symbol).returns(
                                T.attached_class
                              )
                            end
                            def self.new(url:, type: :url)
                            end

                            sig do
                              override.returns({ type: Symbol, url: String })
                            end
                            def to_hash
                            end
                          end

                          sig do
                            override.returns(
                              T::Array[
                                Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Image::Source::Variants
                              ]
                            )
                          end
                          def self.variants
                          end
                        end

                        class CacheControl < Sam::Internal::Type::BaseModel
                          OrHash =
                            T.type_alias do
                              T.any(T.self_type, Sam::Internal::AnyHash)
                            end

                          sig { returns(Symbol) }
                          attr_accessor :type

                          sig { params(type: Symbol).returns(T.attached_class) }
                          def self.new(type: :ephemeral)
                          end

                          sig { override.returns({ type: Symbol }) }
                          def to_hash
                          end
                        end
                      end

                      sig do
                        override.returns(
                          T::Array[
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1::Variants
                          ]
                        )
                      end
                      def self.variants
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::Variants
                        ]
                      )
                    end
                    def self.variants
                    end

                    UnionMember1Array =
                      T.let(
                        Sam::Internal::Type::ArrayOf[
                          union:
                            Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Content::Content::UnionMember1
                        ],
                        Sam::Internal::Type::Converter
                      )
                  end
                end

                class URL < Sam::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig { returns(String) }
                  attr_accessor :url

                  sig do
                    params(url: String, type: Symbol).returns(T.attached_class)
                  end
                  def self.new(url:, type: :url)
                  end

                  sig { override.returns({ type: Symbol, url: String }) }
                  def to_hash
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Document::Source::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class CacheControl < Sam::Internal::Type::BaseModel
                OrHash =
                  T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                sig { returns(Symbol) }
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({ type: Symbol }) }
                def to_hash
                end
              end

              class Citations < Sam::Internal::Type::BaseModel
                OrHash =
                  T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :enabled

                sig { params(enabled: T::Boolean).void }
                attr_writer :enabled

                sig { params(enabled: T::Boolean).returns(T.attached_class) }
                def self.new(enabled: nil)
                end

                sig { override.returns({ enabled: T::Boolean }) }
                def to_hash
                end
              end
            end

            class Thinking < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :signature

              sig { returns(String) }
              attr_accessor :thinking

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(
                  signature: String,
                  thinking: String,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(signature:, thinking:, type: :thinking)
              end

              sig do
                override.returns(
                  { signature: String, thinking: String, type: Symbol }
                )
              end
              def to_hash
              end
            end

            class RedactedThinking < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :data

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(data: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(data:, type: :redacted_thinking)
              end

              sig { override.returns({ data: String, type: Symbol }) }
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                Sam::MessageCountTokensBetaParams::Message::Content::Variants
              ]
            )
          end
          def self.variants
          end

          UnionMember1Array =
            T.let(
              Sam::Internal::Type::ArrayOf[
                union:
                  Sam::MessageCountTokensBetaParams::Message::Content::UnionMember1
              ],
              Sam::Internal::Type::Converter
            )
        end

        module Role
          extend Sam::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sam::MessageCountTokensBetaParams::Message::Role)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER =
            T.let(
              :user,
              Sam::MessageCountTokensBetaParams::Message::Role::TaggedSymbol
            )
          ASSISTANT =
            T.let(
              :assistant,
              Sam::MessageCountTokensBetaParams::Message::Role::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sam::MessageCountTokensBetaParams::Message::Role::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # System prompt.
      #
      # A system prompt is a way of providing context and instructions to Claude, such
      # as specifying a particular goal or role. See our
      # [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      module System
        extend Sam::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              T::Array[Sam::MessageCountTokensBetaParams::System::UnionMember1]
            )
          end

        class UnionMember1 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :text

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::System::UnionMember1::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::System::UnionMember1::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          sig do
            returns(
              T.nilable(
                T::Array[
                  T.any(
                    Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::CharLocation,
                    Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::PageLocation,
                    Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::ContentBlockLocation
                  )
                ]
              )
            )
          end
          attr_accessor :citations

          sig do
            params(
              text: String,
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::System::UnionMember1::CacheControl::OrHash
                ),
              citations:
                T.nilable(
                  T::Array[
                    T.any(
                      Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::CharLocation::OrHash,
                      Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::PageLocation::OrHash,
                      Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::ContentBlockLocation::OrHash
                    )
                  ]
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(text:, cache_control: nil, citations: nil, type: :text)
          end

          sig do
            override.returns(
              {
                text: String,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::System::UnionMember1::CacheControl
                  ),
                citations:
                  T.nilable(
                    T::Array[
                      T.any(
                        Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::CharLocation,
                        Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::PageLocation,
                        Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::ContentBlockLocation
                      )
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          module Citation
            extend Sam::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::CharLocation,
                  Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::PageLocation,
                  Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::ContentBlockLocation
                )
              end

            class CharLocation < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :cited_text

              sig { returns(Integer) }
              attr_accessor :document_index

              sig { returns(T.nilable(String)) }
              attr_accessor :document_title

              sig { returns(Integer) }
              attr_accessor :end_char_index

              sig { returns(Integer) }
              attr_accessor :start_char_index

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(
                  cited_text: String,
                  document_index: Integer,
                  document_title: T.nilable(String),
                  end_char_index: Integer,
                  start_char_index: Integer,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                cited_text:,
                document_index:,
                document_title:,
                end_char_index:,
                start_char_index:,
                type: :char_location
              )
              end

              sig do
                override.returns(
                  {
                    cited_text: String,
                    document_index: Integer,
                    document_title: T.nilable(String),
                    end_char_index: Integer,
                    start_char_index: Integer,
                    type: Symbol
                  }
                )
              end
              def to_hash
              end
            end

            class PageLocation < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :cited_text

              sig { returns(Integer) }
              attr_accessor :document_index

              sig { returns(T.nilable(String)) }
              attr_accessor :document_title

              sig { returns(Integer) }
              attr_accessor :end_page_number

              sig { returns(Integer) }
              attr_accessor :start_page_number

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(
                  cited_text: String,
                  document_index: Integer,
                  document_title: T.nilable(String),
                  end_page_number: Integer,
                  start_page_number: Integer,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                cited_text:,
                document_index:,
                document_title:,
                end_page_number:,
                start_page_number:,
                type: :page_location
              )
              end

              sig do
                override.returns(
                  {
                    cited_text: String,
                    document_index: Integer,
                    document_title: T.nilable(String),
                    end_page_number: Integer,
                    start_page_number: Integer,
                    type: Symbol
                  }
                )
              end
              def to_hash
              end
            end

            class ContentBlockLocation < Sam::Internal::Type::BaseModel
              OrHash =
                T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

              sig { returns(String) }
              attr_accessor :cited_text

              sig { returns(Integer) }
              attr_accessor :document_index

              sig { returns(T.nilable(String)) }
              attr_accessor :document_title

              sig { returns(Integer) }
              attr_accessor :end_block_index

              sig { returns(Integer) }
              attr_accessor :start_block_index

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(
                  cited_text: String,
                  document_index: Integer,
                  document_title: T.nilable(String),
                  end_block_index: Integer,
                  start_block_index: Integer,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                cited_text:,
                document_index:,
                document_title:,
                end_block_index:,
                start_block_index:,
                type: :content_block_location
              )
              end

              sig do
                override.returns(
                  {
                    cited_text: String,
                    document_index: Integer,
                    document_title: T.nilable(String),
                    end_block_index: Integer,
                    start_block_index: Integer,
                    type: Symbol
                  }
                )
              end
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  Sam::MessageCountTokensBetaParams::System::UnionMember1::Citation::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        sig do
          override.returns(
            T::Array[Sam::MessageCountTokensBetaParams::System::Variants]
          )
        end
        def self.variants
        end

        UnionMember1Array =
          T.let(
            Sam::Internal::Type::ArrayOf[
              Sam::MessageCountTokensBetaParams::System::UnionMember1
            ],
            Sam::Internal::Type::Converter
          )
      end

      # Configuration for enabling Claude's extended thinking.
      #
      # When enabled, responses include `thinking` content blocks showing Claude's
      # thinking process before the final answer. Requires a minimum budget of 1,024
      # tokens and counts towards your `max_tokens` limit.
      #
      # See
      # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      # for details.
      module Thinking
        extend Sam::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Sam::MessageCountTokensBetaParams::Thinking::Enabled,
              Sam::MessageCountTokensBetaParams::Thinking::Disabled
            )
          end

        class Enabled < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # Determines how many tokens Claude can use for its internal reasoning process.
          # Larger budgets can enable more thorough analysis for complex problems, improving
          # response quality.
          #
          # Must be ≥1024 and less than `max_tokens`.
          #
          # See
          # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
          # for details.
          sig { returns(Integer) }
          attr_accessor :budget_tokens

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(budget_tokens: Integer, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Determines how many tokens Claude can use for its internal reasoning process.
            # Larger budgets can enable more thorough analysis for complex problems, improving
            # response quality.
            #
            # Must be ≥1024 and less than `max_tokens`.
            #
            # See
            # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
            # for details.
            budget_tokens:,
            type: :enabled
          )
          end

          sig { override.returns({ budget_tokens: Integer, type: Symbol }) }
          def to_hash
          end
        end

        class Disabled < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :disabled)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Sam::MessageCountTokensBetaParams::Thinking::Variants]
          )
        end
        def self.variants
        end
      end

      # How the model should use the provided tools. The model can use a specific tool,
      # any available tool, decide by itself, or not use tools at all.
      module ToolChoice
        extend Sam::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Sam::MessageCountTokensBetaParams::ToolChoice::Auto,
              Sam::MessageCountTokensBetaParams::ToolChoice::Any,
              Sam::MessageCountTokensBetaParams::ToolChoice::Tool,
              Sam::MessageCountTokensBetaParams::ToolChoice::None
            )
          end

        class Auto < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          sig { returns(Symbol) }
          attr_accessor :type

          # Whether to disable parallel tool use.
          #
          # Defaults to `false`. If set to `true`, the model will output at most one tool
          # use.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :disable_parallel_tool_use

          sig { params(disable_parallel_tool_use: T::Boolean).void }
          attr_writer :disable_parallel_tool_use

          # The model will automatically decide whether to use tools.
          sig do
            params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Whether to disable parallel tool use.
            #
            # Defaults to `false`. If set to `true`, the model will output at most one tool
            # use.
            disable_parallel_tool_use: nil,
            type: :auto
          )
          end

          sig do
            override.returns(
              { type: Symbol, disable_parallel_tool_use: T::Boolean }
            )
          end
          def to_hash
          end
        end

        class Any < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          sig { returns(Symbol) }
          attr_accessor :type

          # Whether to disable parallel tool use.
          #
          # Defaults to `false`. If set to `true`, the model will output exactly one tool
          # use.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :disable_parallel_tool_use

          sig { params(disable_parallel_tool_use: T::Boolean).void }
          attr_writer :disable_parallel_tool_use

          # The model will use any available tools.
          sig do
            params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Whether to disable parallel tool use.
            #
            # Defaults to `false`. If set to `true`, the model will output exactly one tool
            # use.
            disable_parallel_tool_use: nil,
            type: :any
          )
          end

          sig do
            override.returns(
              { type: Symbol, disable_parallel_tool_use: T::Boolean }
            )
          end
          def to_hash
          end
        end

        class Tool < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # The name of the tool to use.
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          # Whether to disable parallel tool use.
          #
          # Defaults to `false`. If set to `true`, the model will output exactly one tool
          # use.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :disable_parallel_tool_use

          sig { params(disable_parallel_tool_use: T::Boolean).void }
          attr_writer :disable_parallel_tool_use

          # The model will use the specified tool with `tool_choice.name`.
          sig do
            params(
              name: String,
              disable_parallel_tool_use: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The name of the tool to use.
            name:,
            # Whether to disable parallel tool use.
            #
            # Defaults to `false`. If set to `true`, the model will output exactly one tool
            # use.
            disable_parallel_tool_use: nil,
            type: :tool
          )
          end

          sig do
            override.returns(
              {
                name: String,
                type: Symbol,
                disable_parallel_tool_use: T::Boolean
              }
            )
          end
          def to_hash
          end
        end

        class None < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          sig { returns(Symbol) }
          attr_accessor :type

          # The model will not be allowed to use tools.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :none)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Sam::MessageCountTokensBetaParams::ToolChoice::Variants]
          )
        end
        def self.variants
        end
      end

      module Tool
        extend Sam::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Sam::MessageCountTokensBetaParams::Tool::BetaTool,
              Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
              Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
              Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
              Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
              Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
              Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
            )
          end

        class BetaTool < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          # This defines the shape of the `input` that your tool accepts and that the model
          # will produce.
          sig do
            returns(
              Sam::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema
            )
          end
          attr_reader :input_schema

          sig do
            params(
              input_schema:
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema::OrHash
            ).void
          end
          attr_writer :input_schema

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          # Description of what this tool does.
          #
          # Tool descriptions should be as detailed as possible. The more information that
          # the model has about what the tool is and how to use it, the better it will
          # perform. You can use natural language descriptions to reinforce important
          # aspects of the tool input JSON schema.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::Type::OrSymbol
              )
            )
          end
          attr_accessor :type

          sig do
            params(
              input_schema:
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema::OrHash,
              name: String,
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl::OrHash
                ),
              description: String,
              type:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool::Type::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
            #
            # This defines the shape of the `input` that your tool accepts and that the model
            # will produce.
            input_schema:,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name:,
            cache_control: nil,
            # Description of what this tool does.
            #
            # Tool descriptions should be as detailed as possible. The more information that
            # the model has about what the tool is and how to use it, the better it will
            # perform. You can use natural language descriptions to reinforce important
            # aspects of the tool input JSON schema.
            description: nil,
            type: nil
          )
          end

          sig do
            override.returns(
              {
                input_schema:
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema,
                name: String,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl
                  ),
                description: String,
                type:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaTool::Type::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          class InputSchema < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { returns(T.nilable(T.anything)) }
            attr_accessor :properties

            # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
            #
            # This defines the shape of the `input` that your tool accepts and that the model
            # will produce.
            sig do
              params(properties: T.nilable(T.anything), type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(properties: nil, type: :object)
            end

            sig do
              override.returns(
                { type: Symbol, properties: T.nilable(T.anything) }
              )
            end
            def to_hash
            end
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          module Type
            extend Sam::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CUSTOM =
              T.let(
                :custom,
                Sam::MessageCountTokensBetaParams::Tool::BetaTool::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sam::MessageCountTokensBetaParams::Tool::BetaTool::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class BetaComputerUseTool20241022 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # The height of the display in pixels.
          sig { returns(Integer) }
          attr_accessor :display_height_px

          # The width of the display in pixels.
          sig { returns(Integer) }
          attr_accessor :display_width_px

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          # The X11 display number (e.g. 0, 1) for the display.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :display_number

          sig do
            params(
              display_height_px: Integer,
              display_width_px: Integer,
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl::OrHash
                ),
              display_number: T.nilable(Integer),
              name: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The height of the display in pixels.
            display_height_px:,
            # The width of the display in pixels.
            display_width_px:,
            cache_control: nil,
            # The X11 display number (e.g. 0, 1) for the display.
            display_number: nil,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name: :computer,
            type: :computer_20241022
          )
          end

          sig do
            override.returns(
              {
                display_height_px: Integer,
                display_width_px: Integer,
                name: Symbol,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl
                  ),
                display_number: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end

        class BetaBashTool20241022 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl::OrHash
                ),
              name: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            cache_control: nil,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name: :bash,
            type: :bash_20241022
          )
          end

          sig do
            override.returns(
              {
                name: Symbol,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl
                  )
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end

        class BetaTextEditor20241022 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl::OrHash
                ),
              name: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            cache_control: nil,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name: :str_replace_editor,
            type: :text_editor_20241022
          )
          end

          sig do
            override.returns(
              {
                name: Symbol,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl
                  )
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end

        class BetaComputerUseTool20250124 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # The height of the display in pixels.
          sig { returns(Integer) }
          attr_accessor :display_height_px

          # The width of the display in pixels.
          sig { returns(Integer) }
          attr_accessor :display_width_px

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          # The X11 display number (e.g. 0, 1) for the display.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :display_number

          sig do
            params(
              display_height_px: Integer,
              display_width_px: Integer,
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl::OrHash
                ),
              display_number: T.nilable(Integer),
              name: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The height of the display in pixels.
            display_height_px:,
            # The width of the display in pixels.
            display_width_px:,
            cache_control: nil,
            # The X11 display number (e.g. 0, 1) for the display.
            display_number: nil,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name: :computer,
            type: :computer_20250124
          )
          end

          sig do
            override.returns(
              {
                display_height_px: Integer,
                display_width_px: Integer,
                name: Symbol,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl
                  ),
                display_number: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end

        class BetaBashTool20250124 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl::OrHash
                ),
              name: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            cache_control: nil,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name: :bash,
            type: :bash_20250124
          )
          end

          sig do
            override.returns(
              {
                name: Symbol,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl
                  )
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end

        class BetaTextEditor20250124 < Sam::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl
              )
            )
          end
          attr_reader :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl::OrHash
                )
            ).void
          end
          attr_writer :cache_control

          sig do
            params(
              cache_control:
                T.nilable(
                  Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl::OrHash
                ),
              name: Symbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            cache_control: nil,
            # Name of the tool.
            #
            # This is how the tool will be called by the model and in tool_use blocks.
            name: :str_replace_editor,
            type: :text_editor_20250124
          )
          end

          sig do
            override.returns(
              {
                name: Symbol,
                type: Symbol,
                cache_control:
                  T.nilable(
                    Sam::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl
                  )
              }
            )
          end
          def to_hash
          end

          class CacheControl < Sam::Internal::Type::BaseModel
            OrHash = T.type_alias { T.any(T.self_type, Sam::Internal::AnyHash) }

            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Sam::MessageCountTokensBetaParams::Tool::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
