# typed: strong

module Sam
  module Models
    class MessageCountTokensBetaParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # Input messages.
      #
      #   Our models are trained to operate on alternating `user` and `assistant`
      #   conversational turns. When creating a new `Message`, you specify the prior
      #   conversational turns with the `messages` parameter, and the model then generates
      #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
      #   in your request will be combined into a single turn.
      #
      #   Each input message must be an object with a `role` and `content`. You can
      #   specify a single `user`-role message, or you can include multiple `user` and
      #   `assistant` messages.
      #
      #   If the final message uses the `assistant` role, the response content will
      #   continue immediately from the content in that message. This can be used to
      #   constrain part of the model's response.
      #
      #   Example with a single `user` message:
      #
      #   ```json
      #   [{ "role": "user", "content": "Hello, Claude" }]
      #   ```
      #
      #   Example with multiple conversational turns:
      #
      #   ```json
      #   [
      #     { "role": "user", "content": "Hello there." },
      #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
      #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
      #   ]
      #   ```
      #
      #   Example with a partially-filled response from Claude:
      #
      #   ```json
      #   [
      #     {
      #       "role": "user",
      #       "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
      #     },
      #     { "role": "assistant", "content": "The best answer is (" }
      #   ]
      #   ```
      #
      #   Each input message `content` may be either a single `string` or an array of
      #   content blocks, where each block has a specific `type`. Using a `string` for
      #   `content` is shorthand for an array of one content block of type `"text"`. The
      #   following input messages are equivalent:
      #
      #   ```json
      #   { "role": "user", "content": "Hello, Claude" }
      #   ```
      #
      #   ```json
      #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
      #   ```
      #
      #   Starting with Claude 3 models, you can also send image content blocks:
      #
      #   ```json
      #   {
      #     "role": "user",
      #     "content": [
      #       {
      #         "type": "image",
      #         "source": {
      #           "type": "base64",
      #           "media_type": "image/jpeg",
      #           "data": "/9j/4AAQSkZJRg..."
      #         }
      #       },
      #       { "type": "text", "text": "What is in this image?" }
      #     ]
      #   }
      #   ```
      #
      #   We currently support the `base64` source type for images, and the `image/jpeg`,
      #   `image/png`, `image/gif`, and `image/webp` media types.
      #
      #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
      #   more input examples.
      #
      #   Note that if you want to include a
      #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
      #   the top-level `system` parameter — there is no `"system"` role for input
      #   messages in the Messages API.
      sig { returns(T::Array[Sam::Models::MessageCountTokensBetaParams::Message]) }
      def messages
      end

      sig do
        params(_: T::Array[Sam::Models::MessageCountTokensBetaParams::Message])
          .returns(T::Array[Sam::Models::MessageCountTokensBetaParams::Message])
      end
      def messages=(_)
      end

      # The model that will complete your prompt.
      #
      #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(String) }
      def model
      end

      sig { params(_: String).returns(String) }
      def model=(_)
      end

      # System prompt.
      #
      #   A system prompt is a way of providing context and instructions to Claude, such
      #   as specifying a particular goal or role. See our
      #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      sig do
        returns(
          T.nilable(T.any(String, T::Array[Sam::Models::MessageCountTokensBetaParams::System::UnionMember1]))
        )
      end
      def system_
      end

      sig do
        params(_: T.any(String, T::Array[Sam::Models::MessageCountTokensBetaParams::System::UnionMember1]))
          .returns(T.any(String, T::Array[Sam::Models::MessageCountTokensBetaParams::System::UnionMember1]))
      end
      def system_=(_)
      end

      # Configuration for enabling Claude's extended thinking.
      #
      #   When enabled, responses include `thinking` content blocks showing Claude's
      #   thinking process before the final answer. Requires a minimum budget of 1,024
      #   tokens and counts towards your `max_tokens` limit.
      #
      #   See
      #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      sig do
        returns(
          T.nilable(
            T.any(
              Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigEnabled,
              Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigDisabled
            )
          )
        )
      end
      def thinking
      end

      sig do
        params(
          _: T.any(
            Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigEnabled,
            Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigDisabled
          )
        )
          .returns(
            T.any(
              Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigEnabled,
              Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigDisabled
            )
          )
      end
      def thinking=(_)
      end

      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      sig do
        returns(
          T.nilable(
            T.any(
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAuto,
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAny,
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceTool,
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceNone
            )
          )
        )
      end
      def tool_choice
      end

      sig do
        params(
          _: T.any(
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAuto,
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAny,
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceTool,
            Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceNone
          )
        )
          .returns(
            T.any(
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAuto,
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAny,
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceTool,
              Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceNone
            )
          )
      end
      def tool_choice=(_)
      end

      # Definitions of tools that the model may use.
      #
      #   If you include `tools` in your API request, the model may return `tool_use`
      #   content blocks that represent the model's use of those tools. You can then run
      #   those tools using the tool input generated by the model and then optionally
      #   return results back to the model using `tool_result` content blocks.
      #
      #   Each tool definition includes:
      #
      #   - `name`: Name of the tool.
      #   - `description`: Optional, but strongly-recommended description of the tool.
      #   - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
      #     tool `input` shape that the model will produce in `tool_use` output content
      #     blocks.
      #
      #   For example, if you defined `tools` as:
      #
      #   ```json
      #   [
      #     {
      #       "name": "get_stock_price",
      #       "description": "Get the current stock price for a given ticker symbol.",
      #       "input_schema": {
      #         "type": "object",
      #         "properties": {
      #           "ticker": {
      #             "type": "string",
      #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
      #           }
      #         },
      #         "required": ["ticker"]
      #       }
      #     }
      #   ]
      #   ```
      #
      #   And then asked the model "What's the S&P 500 at today?", the model might produce
      #   `tool_use` content blocks in the response like this:
      #
      #   ```json
      #   [
      #     {
      #       "type": "tool_use",
      #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
      #       "name": "get_stock_price",
      #       "input": { "ticker": "^GSPC" }
      #     }
      #   ]
      #   ```
      #
      #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
      #   input, and return the following back to the model in a subsequent `user`
      #   message:
      #
      #   ```json
      #   [
      #     {
      #       "type": "tool_result",
      #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
      #       "content": "259.75 USD"
      #     }
      #   ]
      #   ```
      #
      #   Tools can be used for workflows that include running client-side tools and
      #   functions, or more generally whenever you want the model to produce a particular
      #   JSON structure of output.
      #
      #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
      sig do
        returns(
          T.nilable(
            T::Array[
            T.any(
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
            )
            ]
          )
        )
      end
      def tools
      end

      sig do
        params(
          _: T::Array[
          T.any(
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
            Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
          )
          ]
        )
          .returns(
            T::Array[
            T.any(
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124,
              Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124
            )
            ]
          )
      end
      def tools=(_)
      end

      # Optional header to specify the beta version(s) you want to use.
      #
      #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
      #   the header multiple times for each beta.
      sig { returns(T.nilable(T::Array[String])) }
      def anthropic_beta
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def anthropic_beta=(_)
      end

      # The version of the Anthropic API you want to use.
      #
      #   Read more about versioning and our version history
      #   [here](https://docs.anthropic.com/en/api/versioning).
      sig { returns(T.nilable(String)) }
      def anthropic_version
      end

      sig { params(_: String).returns(String) }
      def anthropic_version=(_)
      end

      # Your unique API key for authentication.
      #
      #   This key is required in the header of all API requests, to authenticate your
      #   account and access Anthropic's services. Get your API key through the
      #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #   Workspace.
      sig { returns(T.nilable(String)) }
      def x_api_key
      end

      sig { params(_: String).returns(String) }
      def x_api_key=(_)
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
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
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
        override
          .returns(
            {
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
              request_options: Sam::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Message < Sam::BaseModel
        sig do
          returns(
            T.any(
              String,
              T::Array[
              T.any(
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
              )
              ]
            )
          )
        end
        def content
        end

        sig do
          params(
            _: T.any(
              String,
              T::Array[
              T.any(
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
              )
              ]
            )
          )
            .returns(
              T.any(
                String,
                T::Array[
                T.any(
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
                )
                ]
              )
            )
        end
        def content=(_)
        end

        sig { returns(Symbol) }
        def role
        end

        sig { params(_: Symbol).returns(Symbol) }
        def role=(_)
        end

        sig do
          params(
            content: T.any(
              String,
              T::Array[
              T.any(
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
              )
              ]
            ),
            role: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(content:, role:)
        end

        sig do
          override
            .returns(
              {
                content: T.any(
                  String,
                  T::Array[
                  T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
                  )
                  ]
                ),
                role: Symbol
              }
            )
        end
        def to_hash
        end

        class Content < Sam::Union
          abstract!

          UnionMember1Array = T.type_alias do
            T::Array[
            T.any(
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
            )
            ]
          end

          class UnionMember1 < Sam::Union
            abstract!

            class BetaRequestTextBlock < Sam::BaseModel
              sig { returns(String) }
              def text
              end

              sig { params(_: String).returns(String) }
              def text=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                returns(
                  T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                    )
                    ]
                  )
                )
              end
              def citations
              end

              sig do
                params(
                  _: T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                    )
                    ]
                  )
                )
                  .returns(
                    T.nilable(
                      T::Array[
                      T.any(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                      )
                      ]
                    )
                  )
              end
              def citations=(_)
              end

              sig do
                params(
                  text: String,
                  cache_control: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                  ),
                  citations: T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                    )
                    ]
                  ),
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(text:, cache_control: nil, citations: nil, type: :text)
              end

              sig do
                override
                  .returns(
                    {
                      text: String,
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                      ),
                      citations: T.nilable(
                        T::Array[
                        T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                        )
                        ]
                      )
                    }
                  )
              end
              def to_hash
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                def type
                end

                sig { params(_: Symbol).returns(Symbol) }
                def type=(_)
                end

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end

              class Citation < Sam::Union
                abstract!

                class BetaRequestCharLocationCitation < Sam::BaseModel
                  sig { returns(String) }
                  def cited_text
                  end

                  sig { params(_: String).returns(String) }
                  def cited_text=(_)
                  end

                  sig { returns(Integer) }
                  def document_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def document_index=(_)
                  end

                  sig { returns(T.nilable(String)) }
                  def document_title
                  end

                  sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                  def document_title=(_)
                  end

                  sig { returns(Integer) }
                  def end_char_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def end_char_index=(_)
                  end

                  sig { returns(Integer) }
                  def start_char_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def start_char_index=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig do
                    params(
                      cited_text: String,
                      document_index: Integer,
                      document_title: T.nilable(String),
                      end_char_index: Integer,
                      start_char_index: Integer,
                      type: Symbol
                    )
                      .returns(T.attached_class)
                  end
                  def self.new(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
                  end

                  sig do
                    override
                      .returns(
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

                class BetaRequestPageLocationCitation < Sam::BaseModel
                  sig { returns(String) }
                  def cited_text
                  end

                  sig { params(_: String).returns(String) }
                  def cited_text=(_)
                  end

                  sig { returns(Integer) }
                  def document_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def document_index=(_)
                  end

                  sig { returns(T.nilable(String)) }
                  def document_title
                  end

                  sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                  def document_title=(_)
                  end

                  sig { returns(Integer) }
                  def end_page_number
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def end_page_number=(_)
                  end

                  sig { returns(Integer) }
                  def start_page_number
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def start_page_number=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig do
                    params(
                      cited_text: String,
                      document_index: Integer,
                      document_title: T.nilable(String),
                      end_page_number: Integer,
                      start_page_number: Integer,
                      type: Symbol
                    )
                      .returns(T.attached_class)
                  end
                  def self.new(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
                  end

                  sig do
                    override
                      .returns(
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

                class BetaRequestContentBlockLocationCitation < Sam::BaseModel
                  sig { returns(String) }
                  def cited_text
                  end

                  sig { params(_: String).returns(String) }
                  def cited_text=(_)
                  end

                  sig { returns(Integer) }
                  def document_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def document_index=(_)
                  end

                  sig { returns(T.nilable(String)) }
                  def document_title
                  end

                  sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                  def document_title=(_)
                  end

                  sig { returns(Integer) }
                  def end_block_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def end_block_index=(_)
                  end

                  sig { returns(Integer) }
                  def start_block_index
                  end

                  sig { params(_: Integer).returns(Integer) }
                  def start_block_index=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig do
                    params(
                      cited_text: String,
                      document_index: Integer,
                      document_title: T.nilable(String),
                      end_block_index: Integer,
                      start_block_index: Integer,
                      type: Symbol
                    )
                      .returns(T.attached_class)
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
                    override
                      .returns(
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

                class << self
                  sig do
                    override
                      .returns(
                        [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation]
                      )
                  end
                  def variants
                  end
                end
              end
            end

            class BetaRequestImageBlock < Sam::BaseModel
              sig do
                returns(
                  T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                  )
                )
              end
              def source
              end

              sig do
                params(
                  _: T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                  )
                )
                  .returns(
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                    )
                  )
              end
              def source=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                params(
                  source: T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                  ),
                  cache_control: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                  ),
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(source:, cache_control: nil, type: :image)
              end

              sig do
                override
                  .returns(
                    {
                      source: T.any(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                      ),
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                      )
                    }
                  )
              end
              def to_hash
              end

              class Source < Sam::Union
                abstract!

                class BetaBase64ImageSource < Sam::BaseModel
                  sig { returns(String) }
                  def data
                  end

                  sig { params(_: String).returns(String) }
                  def data=(_)
                  end

                  sig { returns(Symbol) }
                  def media_type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def media_type=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
                  def self.new(data:, media_type:, type: :base64)
                  end

                  sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                  def to_hash
                  end

                  class MediaType < Sam::Enum
                    abstract!

                    IMAGE_JPEG = :"image/jpeg"
                    IMAGE_PNG = :"image/png"
                    IMAGE_GIF = :"image/gif"
                    IMAGE_WEBP = :"image/webp"

                    class << self
                      sig { override.returns(T::Array[Symbol]) }
                      def values
                      end
                    end
                  end
                end

                class BetaURLImageSource < Sam::BaseModel
                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { returns(String) }
                  def url
                  end

                  sig { params(_: String).returns(String) }
                  def url=(_)
                  end

                  sig { params(url: String, type: Symbol).returns(T.attached_class) }
                  def self.new(url:, type: :url)
                  end

                  sig { override.returns({type: Symbol, url: String}) }
                  def to_hash
                  end
                end

                class << self
                  sig do
                    override
                      .returns(
                        [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource]
                      )
                  end
                  def variants
                  end
                end
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                def type
                end

                sig { params(_: Symbol).returns(Symbol) }
                def type=(_)
                end

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end
            end

            class BetaRequestToolUseBlock < Sam::BaseModel
              sig { returns(String) }
              def id
              end

              sig { params(_: String).returns(String) }
              def id=(_)
              end

              sig { returns(T.anything) }
              def input
              end

              sig { params(_: T.anything).returns(T.anything) }
              def input=(_)
              end

              sig { returns(String) }
              def name
              end

              sig { params(_: String).returns(String) }
              def name=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                params(
                  id: String,
                  input: T.anything,
                  name: String,
                  cache_control: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock::CacheControl
                  ),
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(id:, input:, name:, cache_control: nil, type: :tool_use)
              end

              sig do
                override
                  .returns(
                    {
                      id: String,
                      input: T.anything,
                      name: String,
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock::CacheControl
                      )
                    }
                  )
              end
              def to_hash
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                def type
                end

                sig { params(_: Symbol).returns(Symbol) }
                def type=(_)
                end

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end
            end

            class BetaRequestToolResultBlock < Sam::BaseModel
              sig { returns(String) }
              def tool_use_id
              end

              sig { params(_: String).returns(String) }
              def tool_use_id=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                returns(
                  T.nilable(
                    T.any(
                      String,
                      T::Array[
                      T.any(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                      )
                      ]
                    )
                  )
                )
              end
              def content
              end

              sig do
                params(
                  _: T.any(
                    String,
                    T::Array[
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                    )
                    ]
                  )
                )
                  .returns(
                    T.any(
                      String,
                      T::Array[
                      T.any(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                      )
                      ]
                    )
                  )
              end
              def content=(_)
              end

              sig { returns(T.nilable(T::Boolean)) }
              def is_error
              end

              sig { params(_: T::Boolean).returns(T::Boolean) }
              def is_error=(_)
              end

              sig do
                params(
                  tool_use_id: String,
                  cache_control: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::CacheControl
                  ),
                  content: T.any(
                    String,
                    T::Array[
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                    )
                    ]
                  ),
                  is_error: T::Boolean,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
              end

              sig do
                override
                  .returns(
                    {
                      tool_use_id: String,
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::CacheControl
                      ),
                      content: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                        )
                        ]
                      ),
                      is_error: T::Boolean
                    }
                  )
              end
              def to_hash
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                def type
                end

                sig { params(_: Symbol).returns(Symbol) }
                def type=(_)
                end

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end

              class Content < Sam::Union
                abstract!

                UnionMember1Array = T.type_alias do
                  T::Array[
                  T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                  )
                  ]
                end

                class UnionMember1 < Sam::Union
                  abstract!

                  class BetaRequestTextBlock < Sam::BaseModel
                    sig { returns(String) }
                    def text
                    end

                    sig { params(_: String).returns(String) }
                    def text=(_)
                    end

                    sig { returns(Symbol) }
                    def type
                    end

                    sig { params(_: Symbol).returns(Symbol) }
                    def type=(_)
                    end

                    sig do
                      returns(
                        T.nilable(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                          )
                        )
                    end
                    def cache_control=(_)
                    end

                    sig do
                      returns(
                        T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                          )
                          ]
                        )
                      )
                    end
                    def citations
                    end

                    sig do
                      params(
                        _: T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                          )
                          ]
                        )
                      )
                        .returns(
                          T.nilable(
                            T::Array[
                            T.any(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                            )
                            ]
                          )
                        )
                    end
                    def citations=(_)
                    end

                    sig do
                      params(
                        text: String,
                        cache_control: T.nilable(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                        ),
                        citations: T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                          )
                          ]
                        ),
                        type: Symbol
                      )
                        .returns(T.attached_class)
                    end
                    def self.new(text:, cache_control: nil, citations: nil, type: :text)
                    end

                    sig do
                      override
                        .returns(
                          {
                            text: String,
                            type: Symbol,
                            cache_control: T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                            ),
                            citations: T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                              )
                              ]
                            )
                          }
                        )
                    end
                    def to_hash
                    end

                    class CacheControl < Sam::BaseModel
                      sig { returns(Symbol) }
                      def type
                      end

                      sig { params(_: Symbol).returns(Symbol) }
                      def type=(_)
                      end

                      sig { params(type: Symbol).returns(T.attached_class) }
                      def self.new(type: :ephemeral)
                      end

                      sig { override.returns({type: Symbol}) }
                      def to_hash
                      end
                    end

                    class Citation < Sam::Union
                      abstract!

                      class BetaRequestCharLocationCitation < Sam::BaseModel
                        sig { returns(String) }
                        def cited_text
                        end

                        sig { params(_: String).returns(String) }
                        def cited_text=(_)
                        end

                        sig { returns(Integer) }
                        def document_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def document_index=(_)
                        end

                        sig { returns(T.nilable(String)) }
                        def document_title
                        end

                        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                        def document_title=(_)
                        end

                        sig { returns(Integer) }
                        def end_char_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def end_char_index=(_)
                        end

                        sig { returns(Integer) }
                        def start_char_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def start_char_index=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          params(
                            cited_text: String,
                            document_index: Integer,
                            document_title: T.nilable(String),
                            end_char_index: Integer,
                            start_char_index: Integer,
                            type: Symbol
                          )
                            .returns(T.attached_class)
                        end
                        def self.new(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
                        end

                        sig do
                          override
                            .returns(
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

                      class BetaRequestPageLocationCitation < Sam::BaseModel
                        sig { returns(String) }
                        def cited_text
                        end

                        sig { params(_: String).returns(String) }
                        def cited_text=(_)
                        end

                        sig { returns(Integer) }
                        def document_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def document_index=(_)
                        end

                        sig { returns(T.nilable(String)) }
                        def document_title
                        end

                        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                        def document_title=(_)
                        end

                        sig { returns(Integer) }
                        def end_page_number
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def end_page_number=(_)
                        end

                        sig { returns(Integer) }
                        def start_page_number
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def start_page_number=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          params(
                            cited_text: String,
                            document_index: Integer,
                            document_title: T.nilable(String),
                            end_page_number: Integer,
                            start_page_number: Integer,
                            type: Symbol
                          )
                            .returns(T.attached_class)
                        end
                        def self.new(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
                        end

                        sig do
                          override
                            .returns(
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

                      class BetaRequestContentBlockLocationCitation < Sam::BaseModel
                        sig { returns(String) }
                        def cited_text
                        end

                        sig { params(_: String).returns(String) }
                        def cited_text=(_)
                        end

                        sig { returns(Integer) }
                        def document_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def document_index=(_)
                        end

                        sig { returns(T.nilable(String)) }
                        def document_title
                        end

                        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                        def document_title=(_)
                        end

                        sig { returns(Integer) }
                        def end_block_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def end_block_index=(_)
                        end

                        sig { returns(Integer) }
                        def start_block_index
                        end

                        sig { params(_: Integer).returns(Integer) }
                        def start_block_index=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          params(
                            cited_text: String,
                            document_index: Integer,
                            document_title: T.nilable(String),
                            end_block_index: Integer,
                            start_block_index: Integer,
                            type: Symbol
                          )
                            .returns(T.attached_class)
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
                          override
                            .returns(
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

                      class << self
                        sig do
                          override
                            .returns(
                              [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation]
                            )
                        end
                        def variants
                        end
                      end
                    end
                  end

                  class BetaRequestImageBlock < Sam::BaseModel
                    sig do
                      returns(
                        T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                        )
                      )
                    end
                    def source
                    end

                    sig do
                      params(
                        _: T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                        )
                      )
                        .returns(
                          T.any(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                          )
                        )
                    end
                    def source=(_)
                    end

                    sig { returns(Symbol) }
                    def type
                    end

                    sig { params(_: Symbol).returns(Symbol) }
                    def type=(_)
                    end

                    sig do
                      returns(
                        T.nilable(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                          )
                        )
                    end
                    def cache_control=(_)
                    end

                    sig do
                      params(
                        source: T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                        ),
                        cache_control: T.nilable(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                        ),
                        type: Symbol
                      )
                        .returns(T.attached_class)
                    end
                    def self.new(source:, cache_control: nil, type: :image)
                    end

                    sig do
                      override
                        .returns(
                          {
                            source: T.any(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                            ),
                            type: Symbol,
                            cache_control: T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                            )
                          }
                        )
                    end
                    def to_hash
                    end

                    class Source < Sam::Union
                      abstract!

                      class BetaBase64ImageSource < Sam::BaseModel
                        sig { returns(String) }
                        def data
                        end

                        sig { params(_: String).returns(String) }
                        def data=(_)
                        end

                        sig { returns(Symbol) }
                        def media_type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def media_type=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class)
                        end
                        def self.new(data:, media_type:, type: :base64)
                        end

                        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                        def to_hash
                        end

                        class MediaType < Sam::Enum
                          abstract!

                          IMAGE_JPEG = :"image/jpeg"
                          IMAGE_PNG = :"image/png"
                          IMAGE_GIF = :"image/gif"
                          IMAGE_WEBP = :"image/webp"

                          class << self
                            sig { override.returns(T::Array[Symbol]) }
                            def values
                            end
                          end
                        end
                      end

                      class BetaURLImageSource < Sam::BaseModel
                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig { returns(String) }
                        def url
                        end

                        sig { params(_: String).returns(String) }
                        def url=(_)
                        end

                        sig { params(url: String, type: Symbol).returns(T.attached_class) }
                        def self.new(url:, type: :url)
                        end

                        sig { override.returns({type: Symbol, url: String}) }
                        def to_hash
                        end
                      end

                      class << self
                        sig do
                          override
                            .returns(
                              [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource]
                            )
                        end
                        def variants
                        end
                      end
                    end

                    class CacheControl < Sam::BaseModel
                      sig { returns(Symbol) }
                      def type
                      end

                      sig { params(_: Symbol).returns(Symbol) }
                      def type=(_)
                      end

                      sig { params(type: Symbol).returns(T.attached_class) }
                      def self.new(type: :ephemeral)
                      end

                      sig { override.returns({type: Symbol}) }
                      def to_hash
                      end
                    end
                  end

                  class << self
                    sig do
                      override
                        .returns(
                          [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock]
                        )
                    end
                    def variants
                    end
                  end
                end

                class << self
                  sig do
                    override
                      .returns(
                        [
                          String,
                          T::Array[
                                                  T.any(
                                                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestTextBlock,
                                                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock::Content::UnionMember1::BetaRequestImageBlock
                                                  )
                                                  ]
                        ]
                      )
                  end
                  def variants
                  end
                end
              end
            end

            class BetaRequestDocumentBlock < Sam::BaseModel
              sig do
                returns(
                  T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaBase64PdfSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaPlainTextSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaUrlpdfSource
                  )
                )
              end
              def source
              end

              sig do
                params(
                  _: T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaBase64PdfSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaPlainTextSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaUrlpdfSource
                  )
                )
                  .returns(
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaBase64PdfSource,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaPlainTextSource,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource,
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaUrlpdfSource
                    )
                  )
              end
              def source=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Citations
                  )
                )
              end
              def citations
              end

              sig do
                params(
                  _: Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Citations
                )
                  .returns(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Citations
                  )
              end
              def citations=(_)
              end

              sig { returns(T.nilable(String)) }
              def context
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def context=(_)
              end

              sig { returns(T.nilable(String)) }
              def title
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def title=(_)
              end

              sig do
                params(
                  source: T.any(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaBase64PdfSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaPlainTextSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource,
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaUrlpdfSource
                  ),
                  cache_control: T.nilable(
                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::CacheControl
                  ),
                  citations: Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Citations,
                  context: T.nilable(String),
                  title: T.nilable(String),
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
              end

              sig do
                override
                  .returns(
                    {
                      source: T.any(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaBase64PdfSource,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaPlainTextSource,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaUrlpdfSource
                      ),
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::CacheControl
                      ),
                      citations: Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Citations,
                      context: T.nilable(String),
                      title: T.nilable(String)
                    }
                  )
              end
              def to_hash
              end

              class Source < Sam::Union
                abstract!

                class BetaBase64PdfSource < Sam::BaseModel
                  sig { returns(String) }
                  def data
                  end

                  sig { params(_: String).returns(String) }
                  def data=(_)
                  end

                  sig { returns(Symbol) }
                  def media_type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def media_type=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
                  def self.new(data:, media_type: :"application/pdf", type: :base64)
                  end

                  sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaPlainTextSource < Sam::BaseModel
                  sig { returns(String) }
                  def data
                  end

                  sig { params(_: String).returns(String) }
                  def data=(_)
                  end

                  sig { returns(Symbol) }
                  def media_type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def media_type=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
                  def self.new(data:, media_type: :"text/plain", type: :text)
                  end

                  sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaContentBlockSource < Sam::BaseModel
                  sig do
                    returns(
                      T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                        )
                        ]
                      )
                    )
                  end
                  def content
                  end

                  sig do
                    params(
                      _: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                        )
                        ]
                      )
                    )
                      .returns(
                        T.any(
                          String,
                          T::Array[
                          T.any(
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                          )
                          ]
                        )
                      )
                  end
                  def content=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig do
                    params(
                      content: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                          Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                        )
                        ]
                      ),
                      type: Symbol
                    )
                      .returns(T.attached_class)
                  end
                  def self.new(content:, type: :content)
                  end

                  sig do
                    override
                      .returns(
                        {
                          content: T.any(
                            String,
                            T::Array[
                            T.any(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                            )
                            ]
                          ),
                          type: Symbol
                        }
                      )
                  end
                  def to_hash
                  end

                  class Content < Sam::Union
                    abstract!

                    UnionMember1Array = T.type_alias do
                      T::Array[
                      T.any(
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                      )
                      ]
                    end

                    class UnionMember1 < Sam::Union
                      abstract!

                      class BetaRequestTextBlock < Sam::BaseModel
                        sig { returns(String) }
                        def text
                        end

                        sig { params(_: String).returns(String) }
                        def text=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          returns(
                            T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                            )
                          )
                        end
                        def cache_control
                        end

                        sig do
                          params(
                            _: T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                            )
                          )
                            .returns(
                              T.nilable(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                              )
                            )
                        end
                        def cache_control=(_)
                        end

                        sig do
                          returns(
                            T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                              )
                              ]
                            )
                          )
                        end
                        def citations
                        end

                        sig do
                          params(
                            _: T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                              )
                              ]
                            )
                          )
                            .returns(
                              T.nilable(
                                T::Array[
                                T.any(
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                                )
                                ]
                              )
                            )
                        end
                        def citations=(_)
                        end

                        sig do
                          params(
                            text: String,
                            cache_control: T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                            ),
                            citations: T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                              )
                              ]
                            ),
                            type: Symbol
                          )
                            .returns(T.attached_class)
                        end
                        def self.new(text:, cache_control: nil, citations: nil, type: :text)
                        end

                        sig do
                          override
                            .returns(
                              {
                                text: String,
                                type: Symbol,
                                cache_control: T.nilable(
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::CacheControl
                                ),
                                citations: T.nilable(
                                  T::Array[
                                  T.any(
                                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation,
                                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation,
                                    Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation
                                  )
                                  ]
                                )
                              }
                            )
                        end
                        def to_hash
                        end

                        class CacheControl < Sam::BaseModel
                          sig { returns(Symbol) }
                          def type
                          end

                          sig { params(_: Symbol).returns(Symbol) }
                          def type=(_)
                          end

                          sig { params(type: Symbol).returns(T.attached_class) }
                          def self.new(type: :ephemeral)
                          end

                          sig { override.returns({type: Symbol}) }
                          def to_hash
                          end
                        end

                        class Citation < Sam::Union
                          abstract!

                          class BetaRequestCharLocationCitation < Sam::BaseModel
                            sig { returns(String) }
                            def cited_text
                            end

                            sig { params(_: String).returns(String) }
                            def cited_text=(_)
                            end

                            sig { returns(Integer) }
                            def document_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def document_index=(_)
                            end

                            sig { returns(T.nilable(String)) }
                            def document_title
                            end

                            sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                            def document_title=(_)
                            end

                            sig { returns(Integer) }
                            def end_char_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def end_char_index=(_)
                            end

                            sig { returns(Integer) }
                            def start_char_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def start_char_index=(_)
                            end

                            sig { returns(Symbol) }
                            def type
                            end

                            sig { params(_: Symbol).returns(Symbol) }
                            def type=(_)
                            end

                            sig do
                              params(
                                cited_text: String,
                                document_index: Integer,
                                document_title: T.nilable(String),
                                end_char_index: Integer,
                                start_char_index: Integer,
                                type: Symbol
                              )
                                .returns(T.attached_class)
                            end
                            def self.new(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
                            end

                            sig do
                              override
                                .returns(
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

                          class BetaRequestPageLocationCitation < Sam::BaseModel
                            sig { returns(String) }
                            def cited_text
                            end

                            sig { params(_: String).returns(String) }
                            def cited_text=(_)
                            end

                            sig { returns(Integer) }
                            def document_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def document_index=(_)
                            end

                            sig { returns(T.nilable(String)) }
                            def document_title
                            end

                            sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                            def document_title=(_)
                            end

                            sig { returns(Integer) }
                            def end_page_number
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def end_page_number=(_)
                            end

                            sig { returns(Integer) }
                            def start_page_number
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def start_page_number=(_)
                            end

                            sig { returns(Symbol) }
                            def type
                            end

                            sig { params(_: Symbol).returns(Symbol) }
                            def type=(_)
                            end

                            sig do
                              params(
                                cited_text: String,
                                document_index: Integer,
                                document_title: T.nilable(String),
                                end_page_number: Integer,
                                start_page_number: Integer,
                                type: Symbol
                              )
                                .returns(T.attached_class)
                            end
                            def self.new(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
                            end

                            sig do
                              override
                                .returns(
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

                          class BetaRequestContentBlockLocationCitation < Sam::BaseModel
                            sig { returns(String) }
                            def cited_text
                            end

                            sig { params(_: String).returns(String) }
                            def cited_text=(_)
                            end

                            sig { returns(Integer) }
                            def document_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def document_index=(_)
                            end

                            sig { returns(T.nilable(String)) }
                            def document_title
                            end

                            sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
                            def document_title=(_)
                            end

                            sig { returns(Integer) }
                            def end_block_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def end_block_index=(_)
                            end

                            sig { returns(Integer) }
                            def start_block_index
                            end

                            sig { params(_: Integer).returns(Integer) }
                            def start_block_index=(_)
                            end

                            sig { returns(Symbol) }
                            def type
                            end

                            sig { params(_: Symbol).returns(Symbol) }
                            def type=(_)
                            end

                            sig do
                              params(
                                cited_text: String,
                                document_index: Integer,
                                document_title: T.nilable(String),
                                end_block_index: Integer,
                                start_block_index: Integer,
                                type: Symbol
                              )
                                .returns(T.attached_class)
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
                              override
                                .returns(
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

                          class << self
                            sig do
                              override
                                .returns(
                                  [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestCharLocationCitation, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestPageLocationCitation, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock::Citation::BetaRequestContentBlockLocationCitation]
                                )
                            end
                            def variants
                            end
                          end
                        end
                      end

                      class BetaRequestImageBlock < Sam::BaseModel
                        sig do
                          returns(
                            T.any(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                            )
                          )
                        end
                        def source
                        end

                        sig do
                          params(
                            _: T.any(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                            )
                          )
                            .returns(
                              T.any(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                              )
                            )
                        end
                        def source=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          returns(
                            T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                            )
                          )
                        end
                        def cache_control
                        end

                        sig do
                          params(
                            _: T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                            )
                          )
                            .returns(
                              T.nilable(
                                Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                              )
                            )
                        end
                        def cache_control=(_)
                        end

                        sig do
                          params(
                            source: T.any(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                            ),
                            cache_control: T.nilable(
                              Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                            ),
                            type: Symbol
                          )
                            .returns(T.attached_class)
                        end
                        def self.new(source:, cache_control: nil, type: :image)
                        end

                        sig do
                          override
                            .returns(
                              {
                                source: T.any(
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource,
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource
                                ),
                                type: Symbol,
                                cache_control: T.nilable(
                                  Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::CacheControl
                                )
                              }
                            )
                        end
                        def to_hash
                        end

                        class Source < Sam::Union
                          abstract!

                          class BetaBase64ImageSource < Sam::BaseModel
                            sig { returns(String) }
                            def data
                            end

                            sig { params(_: String).returns(String) }
                            def data=(_)
                            end

                            sig { returns(Symbol) }
                            def media_type
                            end

                            sig { params(_: Symbol).returns(Symbol) }
                            def media_type=(_)
                            end

                            sig { returns(Symbol) }
                            def type
                            end

                            sig { params(_: Symbol).returns(Symbol) }
                            def type=(_)
                            end

                            sig do
                              params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class)
                            end
                            def self.new(data:, media_type:, type: :base64)
                            end

                            sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                            def to_hash
                            end

                            class MediaType < Sam::Enum
                              abstract!

                              IMAGE_JPEG = :"image/jpeg"
                              IMAGE_PNG = :"image/png"
                              IMAGE_GIF = :"image/gif"
                              IMAGE_WEBP = :"image/webp"

                              class << self
                                sig { override.returns(T::Array[Symbol]) }
                                def values
                                end
                              end
                            end
                          end

                          class BetaURLImageSource < Sam::BaseModel
                            sig { returns(Symbol) }
                            def type
                            end

                            sig { params(_: Symbol).returns(Symbol) }
                            def type=(_)
                            end

                            sig { returns(String) }
                            def url
                            end

                            sig { params(_: String).returns(String) }
                            def url=(_)
                            end

                            sig { params(url: String, type: Symbol).returns(T.attached_class) }
                            def self.new(url:, type: :url)
                            end

                            sig { override.returns({type: Symbol, url: String}) }
                            def to_hash
                            end
                          end

                          class << self
                            sig do
                              override
                                .returns(
                                  [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaBase64ImageSource, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock::Source::BetaURLImageSource]
                                )
                            end
                            def variants
                            end
                          end
                        end

                        class CacheControl < Sam::BaseModel
                          sig { returns(Symbol) }
                          def type
                          end

                          sig { params(_: Symbol).returns(Symbol) }
                          def type=(_)
                          end

                          sig { params(type: Symbol).returns(T.attached_class) }
                          def self.new(type: :ephemeral)
                          end

                          sig { override.returns({type: Symbol}) }
                          def to_hash
                          end
                        end
                      end

                      class << self
                        sig do
                          override
                            .returns(
                              [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock]
                            )
                        end
                        def variants
                        end
                      end
                    end

                    class << self
                      sig do
                        override
                          .returns(
                            [
                              String,
                              T::Array[
                                                          T.any(
                                                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestTextBlock,
                                                            Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource::Content::UnionMember1::BetaRequestImageBlock
                                                          )
                                                          ]
                            ]
                          )
                      end
                      def variants
                      end
                    end
                  end
                end

                class BetaUrlpdfSource < Sam::BaseModel
                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { returns(String) }
                  def url
                  end

                  sig { params(_: String).returns(String) }
                  def url=(_)
                  end

                  sig { params(url: String, type: Symbol).returns(T.attached_class) }
                  def self.new(url:, type: :url)
                  end

                  sig { override.returns({type: Symbol, url: String}) }
                  def to_hash
                  end
                end

                class << self
                  sig do
                    override
                      .returns(
                        [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaBase64PdfSource, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaPlainTextSource, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaContentBlockSource, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock::Source::BetaUrlpdfSource]
                      )
                  end
                  def variants
                  end
                end
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                def type
                end

                sig { params(_: Symbol).returns(Symbol) }
                def type=(_)
                end

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end

              class Citations < Sam::BaseModel
                sig { returns(T.nilable(T::Boolean)) }
                def enabled
                end

                sig { params(_: T::Boolean).returns(T::Boolean) }
                def enabled=(_)
                end

                sig { params(enabled: T::Boolean).returns(T.attached_class) }
                def self.new(enabled: nil)
                end

                sig { override.returns({enabled: T::Boolean}) }
                def to_hash
                end
              end
            end

            class BetaRequestThinkingBlock < Sam::BaseModel
              sig { returns(String) }
              def signature
              end

              sig { params(_: String).returns(String) }
              def signature=(_)
              end

              sig { returns(String) }
              def thinking
              end

              sig { params(_: String).returns(String) }
              def thinking=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(signature: String, thinking: String, type: Symbol).returns(T.attached_class) }
              def self.new(signature:, thinking:, type: :thinking)
              end

              sig { override.returns({signature: String, thinking: String, type: Symbol}) }
              def to_hash
              end
            end

            class BetaRequestRedactedThinkingBlock < Sam::BaseModel
              sig { returns(String) }
              def data
              end

              sig { params(_: String).returns(String) }
              def data=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(data: String, type: Symbol).returns(T.attached_class) }
              def self.new(data:, type: :redacted_thinking)
              end

              sig { override.returns({data: String, type: Symbol}) }
              def to_hash
              end
            end

            class << self
              sig do
                override
                  .returns(
                    [Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock, Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock]
                  )
              end
              def variants
              end
            end
          end

          class << self
            sig do
              override
                .returns(
                  [
                    String,
                    T::Array[
                                      T.any(
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestTextBlock,
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestImageBlock,
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolUseBlock,
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestToolResultBlock,
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestDocumentBlock,
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestThinkingBlock,
                                        Sam::Models::MessageCountTokensBetaParams::Message::Content::UnionMember1::BetaRequestRedactedThinkingBlock
                                      )
                                      ]
                  ]
                )
            end
            def variants
            end
          end
        end

        class Role < Sam::Enum
          abstract!

          USER = :user
          ASSISTANT = :assistant

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end
      end

      # System prompt.
      #
      #   A system prompt is a way of providing context and instructions to Claude, such
      #   as specifying a particular goal or role. See our
      #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      class System < Sam::Union
        abstract!

        UnionMember1Array = T.type_alias { T::Array[Sam::Models::MessageCountTokensBetaParams::System::UnionMember1] }

        class UnionMember1 < Sam::BaseModel
          sig { returns(String) }
          def text
          end

          sig { params(_: String).returns(String) }
          def text=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            returns(
              T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestCharLocationCitation,
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestPageLocationCitation,
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestContentBlockLocationCitation
                )
                ]
              )
            )
          end
          def citations
          end

          sig do
            params(
              _: T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestCharLocationCitation,
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestPageLocationCitation,
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestContentBlockLocationCitation
                )
                ]
              )
            )
              .returns(
                T.nilable(
                  T::Array[
                  T.any(
                    Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestCharLocationCitation,
                    Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestPageLocationCitation,
                    Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestContentBlockLocationCitation
                  )
                  ]
                )
              )
          end
          def citations=(_)
          end

          sig do
            params(
              text: String,
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::CacheControl),
              citations: T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestCharLocationCitation,
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestPageLocationCitation,
                  Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestContentBlockLocationCitation
                )
                ]
              ),
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(text:, cache_control: nil, citations: nil, type: :text)
          end

          sig do
            override
              .returns(
                {
                  text: String,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::CacheControl),
                  citations: T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestCharLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestPageLocationCitation,
                      Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestContentBlockLocationCitation
                    )
                    ]
                  )
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end

          class Citation < Sam::Union
            abstract!

            class BetaRequestCharLocationCitation < Sam::BaseModel
              sig { returns(String) }
              def cited_text
              end

              sig { params(_: String).returns(String) }
              def cited_text=(_)
              end

              sig { returns(Integer) }
              def document_index
              end

              sig { params(_: Integer).returns(Integer) }
              def document_index=(_)
              end

              sig { returns(T.nilable(String)) }
              def document_title
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def document_title=(_)
              end

              sig { returns(Integer) }
              def end_char_index
              end

              sig { params(_: Integer).returns(Integer) }
              def end_char_index=(_)
              end

              sig { returns(Integer) }
              def start_char_index
              end

              sig { params(_: Integer).returns(Integer) }
              def start_char_index=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  cited_text: String,
                  document_index: Integer,
                  document_title: T.nilable(String),
                  end_char_index: Integer,
                  start_char_index: Integer,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
              end

              sig do
                override
                  .returns(
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

            class BetaRequestPageLocationCitation < Sam::BaseModel
              sig { returns(String) }
              def cited_text
              end

              sig { params(_: String).returns(String) }
              def cited_text=(_)
              end

              sig { returns(Integer) }
              def document_index
              end

              sig { params(_: Integer).returns(Integer) }
              def document_index=(_)
              end

              sig { returns(T.nilable(String)) }
              def document_title
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def document_title=(_)
              end

              sig { returns(Integer) }
              def end_page_number
              end

              sig { params(_: Integer).returns(Integer) }
              def end_page_number=(_)
              end

              sig { returns(Integer) }
              def start_page_number
              end

              sig { params(_: Integer).returns(Integer) }
              def start_page_number=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  cited_text: String,
                  document_index: Integer,
                  document_title: T.nilable(String),
                  end_page_number: Integer,
                  start_page_number: Integer,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
              end

              sig do
                override
                  .returns(
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

            class BetaRequestContentBlockLocationCitation < Sam::BaseModel
              sig { returns(String) }
              def cited_text
              end

              sig { params(_: String).returns(String) }
              def cited_text=(_)
              end

              sig { returns(Integer) }
              def document_index
              end

              sig { params(_: Integer).returns(Integer) }
              def document_index=(_)
              end

              sig { returns(T.nilable(String)) }
              def document_title
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def document_title=(_)
              end

              sig { returns(Integer) }
              def end_block_index
              end

              sig { params(_: Integer).returns(Integer) }
              def end_block_index=(_)
              end

              sig { returns(Integer) }
              def start_block_index
              end

              sig { params(_: Integer).returns(Integer) }
              def start_block_index=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  cited_text: String,
                  document_index: Integer,
                  document_title: T.nilable(String),
                  end_block_index: Integer,
                  start_block_index: Integer,
                  type: Symbol
                )
                  .returns(T.attached_class)
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
                override
                  .returns(
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

            class << self
              sig do
                override
                  .returns(
                    [Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestCharLocationCitation, Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestPageLocationCitation, Sam::Models::MessageCountTokensBetaParams::System::UnionMember1::Citation::BetaRequestContentBlockLocationCitation]
                  )
              end
              def variants
              end
            end
          end
        end

        class << self
          sig { override.returns([String, T::Array[Sam::Models::MessageCountTokensBetaParams::System::UnionMember1]]) }
          def variants
          end
        end
      end

      # Configuration for enabling Claude's extended thinking.
      #
      #   When enabled, responses include `thinking` content blocks showing Claude's
      #   thinking process before the final answer. Requires a minimum budget of 1,024
      #   tokens and counts towards your `max_tokens` limit.
      #
      #   See
      #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      class Thinking < Sam::Union
        abstract!

        class BetaThinkingConfigEnabled < Sam::BaseModel
          # Determines how many tokens Claude can use for its internal reasoning process.
          #   Larger budgets can enable more thorough analysis for complex problems, improving
          #   response quality.
          #
          #   Must be ≥1024 and less than `max_tokens`.
          #
          #   See
          #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
          #   for details.
          sig { returns(Integer) }
          def budget_tokens
          end

          sig { params(_: Integer).returns(Integer) }
          def budget_tokens=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(budget_tokens: Integer, type: Symbol).returns(T.attached_class) }
          def self.new(budget_tokens:, type: :enabled)
          end

          sig { override.returns({budget_tokens: Integer, type: Symbol}) }
          def to_hash
          end
        end

        class BetaThinkingConfigDisabled < Sam::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :disabled)
          end

          sig { override.returns({type: Symbol}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigEnabled, Sam::Models::MessageCountTokensBetaParams::Thinking::BetaThinkingConfigDisabled]
              )
          end
          def variants
          end
        end
      end

      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      class ToolChoice < Sam::Union
        abstract!

        class BetaToolChoiceAuto < Sam::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          # Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output at most one tool
          #   use.
          sig { returns(T.nilable(T::Boolean)) }
          def disable_parallel_tool_use
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def disable_parallel_tool_use=(_)
          end

          # The model will automatically decide whether to use tools.
          sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class) }
          def self.new(disable_parallel_tool_use: nil, type: :auto)
          end

          sig { override.returns({type: Symbol, disable_parallel_tool_use: T::Boolean}) }
          def to_hash
          end
        end

        class BetaToolChoiceAny < Sam::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          # Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output exactly one tool
          #   use.
          sig { returns(T.nilable(T::Boolean)) }
          def disable_parallel_tool_use
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def disable_parallel_tool_use=(_)
          end

          # The model will use any available tools.
          sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class) }
          def self.new(disable_parallel_tool_use: nil, type: :any)
          end

          sig { override.returns({type: Symbol, disable_parallel_tool_use: T::Boolean}) }
          def to_hash
          end
        end

        class BetaToolChoiceTool < Sam::BaseModel
          # The name of the tool to use.
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          # Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output exactly one tool
          #   use.
          sig { returns(T.nilable(T::Boolean)) }
          def disable_parallel_tool_use
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def disable_parallel_tool_use=(_)
          end

          # The model will use the specified tool with `tool_choice.name`.
          sig do
            params(
              name: String,
              disable_parallel_tool_use: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(name:, disable_parallel_tool_use: nil, type: :tool)
          end

          sig { override.returns({name: String, type: Symbol, disable_parallel_tool_use: T::Boolean}) }
          def to_hash
          end
        end

        class BetaToolChoiceNone < Sam::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          # The model will not be allowed to use tools.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :none)
          end

          sig { override.returns({type: Symbol}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAuto, Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceAny, Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceTool, Sam::Models::MessageCountTokensBetaParams::ToolChoice::BetaToolChoiceNone]
              )
          end
          def variants
          end
        end
      end

      class Tool < Sam::Union
        abstract!

        class BetaTool < Sam::BaseModel
          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          #   This defines the shape of the `input` that your tool accepts and that the model
          #   will produce.
          sig { returns(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema) }
          def input_schema
          end

          sig do
            params(_: Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema)
              .returns(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema)
          end
          def input_schema=(_)
          end

          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl))
          end
          def cache_control=(_)
          end

          # Description of what this tool does.
          #
          #   Tool descriptions should be as detailed as possible. The more information that
          #   the model has about what the tool is and how to use it, the better it will
          #   perform. You can use natural language descriptions to reinforce important
          #   aspects of the tool input JSON schema.
          sig { returns(T.nilable(String)) }
          def description
          end

          sig { params(_: String).returns(String) }
          def description=(_)
          end

          sig { returns(T.nilable(Symbol)) }
          def type
          end

          sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
          def type=(_)
          end

          sig do
            params(
              input_schema: Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema,
              name: String,
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl),
              description: String,
              type: T.nilable(Symbol)
            )
              .returns(T.attached_class)
          end
          def self.new(input_schema:, name:, cache_control: nil, description: nil, type: nil)
          end

          sig do
            override
              .returns(
                {
                  input_schema: Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::InputSchema,
                  name: String,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool::CacheControl),
                  description: String,
                  type: T.nilable(Symbol)
                }
              )
          end
          def to_hash
          end

          class InputSchema < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { returns(T.nilable(T.anything)) }
            def properties
            end

            sig { params(_: T.nilable(T.anything)).returns(T.nilable(T.anything)) }
            def properties=(_)
            end

            # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
            #
            #   This defines the shape of the `input` that your tool accepts and that the model
            #   will produce.
            sig { params(properties: T.nilable(T.anything), type: Symbol).returns(T.attached_class) }
            def self.new(properties: nil, type: :object)
            end

            sig { override.returns({type: Symbol, properties: T.nilable(T.anything)}) }
            def to_hash
            end
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end

          class Type < Sam::Enum
            abstract!

            CUSTOM = T.let(:custom, T.nilable(Symbol))

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
          end
        end

        class BetaComputerUseTool20241022 < Sam::BaseModel
          # The height of the display in pixels.
          sig { returns(Integer) }
          def display_height_px
          end

          sig { params(_: Integer).returns(Integer) }
          def display_height_px=(_)
          end

          # The width of the display in pixels.
          sig { returns(Integer) }
          def display_width_px
          end

          sig { params(_: Integer).returns(Integer) }
          def display_width_px=(_)
          end

          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          def name
          end

          sig { params(_: Symbol).returns(Symbol) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            returns(
              T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl)
            )
          end
          def cache_control
          end

          sig do
            params(
              _: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl)
            )
              .returns(
                T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl)
              )
          end
          def cache_control=(_)
          end

          # The X11 display number (e.g. 0, 1) for the display.
          sig { returns(T.nilable(Integer)) }
          def display_number
          end

          sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def display_number=(_)
          end

          sig do
            params(
              display_height_px: Integer,
              display_width_px: Integer,
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl),
              display_number: T.nilable(Integer),
              name: Symbol,
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(
            display_height_px:,
            display_width_px:,
            cache_control: nil,
            display_number: nil,
            name: :computer,
            type: :computer_20241022
          )
          end

          sig do
            override
              .returns(
                {
                  display_height_px: Integer,
                  display_width_px: Integer,
                  name: Symbol,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022::CacheControl),
                  display_number: T.nilable(Integer)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        class BetaBashTool20241022 < Sam::BaseModel
          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          def name
          end

          sig { params(_: Symbol).returns(Symbol) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            params(
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl),
              name: Symbol,
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(cache_control: nil, name: :bash, type: :bash_20241022)
          end

          sig do
            override
              .returns(
                {
                  name: Symbol,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022::CacheControl)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        class BetaTextEditor20241022 < Sam::BaseModel
          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          def name
          end

          sig { params(_: Symbol).returns(Symbol) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl)) }
          def cache_control
          end

          sig do
            params(
              _: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl)
            )
              .returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            params(
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl),
              name: Symbol,
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(cache_control: nil, name: :str_replace_editor, type: :text_editor_20241022)
          end

          sig do
            override
              .returns(
                {
                  name: Symbol,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022::CacheControl)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        class BetaComputerUseTool20250124 < Sam::BaseModel
          # The height of the display in pixels.
          sig { returns(Integer) }
          def display_height_px
          end

          sig { params(_: Integer).returns(Integer) }
          def display_height_px=(_)
          end

          # The width of the display in pixels.
          sig { returns(Integer) }
          def display_width_px
          end

          sig { params(_: Integer).returns(Integer) }
          def display_width_px=(_)
          end

          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          def name
          end

          sig { params(_: Symbol).returns(Symbol) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            returns(
              T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl)
            )
          end
          def cache_control
          end

          sig do
            params(
              _: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl)
            )
              .returns(
                T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl)
              )
          end
          def cache_control=(_)
          end

          # The X11 display number (e.g. 0, 1) for the display.
          sig { returns(T.nilable(Integer)) }
          def display_number
          end

          sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def display_number=(_)
          end

          sig do
            params(
              display_height_px: Integer,
              display_width_px: Integer,
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl),
              display_number: T.nilable(Integer),
              name: Symbol,
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(
            display_height_px:,
            display_width_px:,
            cache_control: nil,
            display_number: nil,
            name: :computer,
            type: :computer_20250124
          )
          end

          sig do
            override
              .returns(
                {
                  display_height_px: Integer,
                  display_width_px: Integer,
                  name: Symbol,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124::CacheControl),
                  display_number: T.nilable(Integer)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        class BetaBashTool20250124 < Sam::BaseModel
          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          def name
          end

          sig { params(_: Symbol).returns(Symbol) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            params(
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl),
              name: Symbol,
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(cache_control: nil, name: :bash, type: :bash_20250124)
          end

          sig do
            override
              .returns(
                {
                  name: Symbol,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124::CacheControl)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        class BetaTextEditor20250124 < Sam::BaseModel
          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(Symbol) }
          def name
          end

          sig { params(_: Symbol).returns(Symbol) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl)) }
          def cache_control
          end

          sig do
            params(
              _: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl)
            )
              .returns(T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            params(
              cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl),
              name: Symbol,
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(cache_control: nil, name: :str_replace_editor, type: :text_editor_20250124)
          end

          sig do
            override
              .returns(
                {
                  name: Symbol,
                  type: Symbol,
                  cache_control: T.nilable(Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124::CacheControl)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        class << self
          sig do
            override
              .returns(
                [Sam::Models::MessageCountTokensBetaParams::Tool::BetaTool, Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20241022, Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20241022, Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20241022, Sam::Models::MessageCountTokensBetaParams::Tool::BetaComputerUseTool20250124, Sam::Models::MessageCountTokensBetaParams::Tool::BetaBashTool20250124, Sam::Models::MessageCountTokensBetaParams::Tool::BetaTextEditor20250124]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
