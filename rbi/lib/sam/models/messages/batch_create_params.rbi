# typed: strong

module Sam
  module Models
    module Messages
      class BatchCreateParams < Sam::BaseModel
        extend Sam::RequestParameters::Converter
        include Sam::RequestParameters

        # List of requests for prompt completion. Each is an individual request to create
        #   a Message.
        sig { returns(T::Array[Sam::Models::Messages::BatchCreateParams::Request]) }
        def requests
        end

        sig do
          params(_: T::Array[Sam::Models::Messages::BatchCreateParams::Request])
            .returns(T::Array[Sam::Models::Messages::BatchCreateParams::Request])
        end
        def requests=(_)
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
            requests: T::Array[Sam::Models::Messages::BatchCreateParams::Request],
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .returns(T.attached_class)
        end
        def self.new(requests:, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                requests: T::Array[Sam::Models::Messages::BatchCreateParams::Request],
                anthropic_beta: T::Array[String],
                anthropic_version: String,
                x_api_key: String,
                request_options: Sam::RequestOptions
              }
            )
        end
        def to_hash
        end

        class Request < Sam::BaseModel
          # Developer-provided ID created for each request in a Message Batch. Useful for
          #   matching results to requests, as results may be given out of request order.
          #
          #   Must be unique for each request within the Message Batch.
          sig { returns(String) }
          def custom_id
          end

          sig { params(_: String).returns(String) }
          def custom_id=(_)
          end

          # Messages API creation parameters for the individual request.
          #
          #   See the [Messages API reference](/en/api/messages) for full documentation on
          #   available parameters.
          sig { returns(Sam::Models::Messages::BatchCreateParams::Request::Params) }
          def params
          end

          sig do
            params(_: Sam::Models::Messages::BatchCreateParams::Request::Params)
              .returns(Sam::Models::Messages::BatchCreateParams::Request::Params)
          end
          def params=(_)
          end

          sig do
            params(custom_id: String, params: Sam::Models::Messages::BatchCreateParams::Request::Params)
              .returns(T.attached_class)
          end
          def self.new(custom_id:, params:)
          end

          sig { override.returns({custom_id: String, params: Sam::Models::Messages::BatchCreateParams::Request::Params}) }
          def to_hash
          end

          class Params < Sam::BaseModel
            # The maximum number of tokens to generate before stopping.
            #
            #   Note that our models may stop _before_ reaching this maximum. This parameter
            #   only specifies the absolute maximum number of tokens to generate.
            #
            #   Different models have different maximum values for this parameter. See
            #   [models](https://docs.anthropic.com/en/docs/models-overview) for details.
            sig { returns(Integer) }
            def max_tokens
            end

            sig { params(_: Integer).returns(Integer) }
            def max_tokens=(_)
            end

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
            sig { returns(T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::Message]) }
            def messages
            end

            sig do
              params(_: T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::Message])
                .returns(T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::Message])
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

            # An object describing metadata about the request.
            sig { returns(T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Metadata)) }
            def metadata
            end

            sig do
              params(_: Sam::Models::Messages::BatchCreateParams::Request::Params::Metadata)
                .returns(Sam::Models::Messages::BatchCreateParams::Request::Params::Metadata)
            end
            def metadata=(_)
            end

            # Custom text sequences that will cause the model to stop generating.
            #
            #   Our models will normally stop when they have naturally completed their turn,
            #   which will result in a response `stop_reason` of `"end_turn"`.
            #
            #   If you want the model to stop generating when it encounters custom strings of
            #   text, you can use the `stop_sequences` parameter. If the model encounters one of
            #   the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
            #   and the response `stop_sequence` value will contain the matched stop sequence.
            sig { returns(T.nilable(T::Array[String])) }
            def stop_sequences
            end

            sig { params(_: T::Array[String]).returns(T::Array[String]) }
            def stop_sequences=(_)
            end

            # Whether to incrementally stream the response using server-sent events.
            #
            #   See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
            #   details.
            sig { returns(T.nilable(T::Boolean)) }
            def stream
            end

            sig { params(_: T::Boolean).returns(T::Boolean) }
            def stream=(_)
            end

            # System prompt.
            #
            #   A system prompt is a way of providing context and instructions to Claude, such
            #   as specifying a particular goal or role. See our
            #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
            sig do
              returns(
                T.nilable(
                  T.any(String, T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1])
                )
              )
            end
            def system_
            end

            sig do
              params(
                _: T.any(String, T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1])
              )
                .returns(
                  T.any(String, T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1])
                )
            end
            def system_=(_)
            end

            # Amount of randomness injected into the response.
            #
            #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
            #   for analytical / multiple choice, and closer to `1.0` for creative and
            #   generative tasks.
            #
            #   Note that even with `temperature` of `0.0`, the results will not be fully
            #   deterministic.
            sig { returns(T.nilable(Float)) }
            def temperature
            end

            sig { params(_: Float).returns(Float) }
            def temperature=(_)
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
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigEnabled,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigDisabled
                  )
                )
              )
            end
            def thinking
            end

            sig do
              params(
                _: T.any(
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigEnabled,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigDisabled
                )
              )
                .returns(
                  T.any(
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigEnabled,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigDisabled
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
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAuto,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAny,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceTool,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceNone
                  )
                )
              )
            end
            def tool_choice
            end

            sig do
              params(
                _: T.any(
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAuto,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAny,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceTool,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceNone
                )
              )
                .returns(
                  T.any(
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAuto,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAny,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceTool,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceNone
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
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124
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
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124
                )
                ]
              )
                .returns(
                  T::Array[
                  T.any(
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124,
                    Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124
                  )
                  ]
                )
            end
            def tools=(_)
            end

            # Only sample from the top K options for each subsequent token.
            #
            #   Used to remove "long tail" low probability responses.
            #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
            #
            #   Recommended for advanced use cases only. You usually only need to use
            #   `temperature`.
            sig { returns(T.nilable(Integer)) }
            def top_k
            end

            sig { params(_: Integer).returns(Integer) }
            def top_k=(_)
            end

            # Use nucleus sampling.
            #
            #   In nucleus sampling, we compute the cumulative distribution over all the options
            #   for each subsequent token in decreasing probability order and cut it off once it
            #   reaches a particular probability specified by `top_p`. You should either alter
            #   `temperature` or `top_p`, but not both.
            #
            #   Recommended for advanced use cases only. You usually only need to use
            #   `temperature`.
            sig { returns(T.nilable(Float)) }
            def top_p
            end

            sig { params(_: Float).returns(Float) }
            def top_p=(_)
            end

            # Messages API creation parameters for the individual request.
            #
            #   See the [Messages API reference](/en/api/messages) for full documentation on
            #   available parameters.
            sig do
              params(
                max_tokens: Integer,
                messages: T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::Message],
                model: String,
                metadata: Sam::Models::Messages::BatchCreateParams::Request::Params::Metadata,
                stop_sequences: T::Array[String],
                stream: T::Boolean,
                system_: T.any(String, T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1]),
                temperature: Float,
                thinking: T.any(
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigEnabled,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigDisabled
                ),
                tool_choice: T.any(
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAuto,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAny,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceTool,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceNone
                ),
                tools: T::Array[
                T.any(
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124,
                  Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124
                )
                ],
                top_k: Integer,
                top_p: Float
              )
                .returns(T.attached_class)
            end
            def self.new(
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
              top_p: nil
            )
            end

            sig do
              override
                .returns(
                  {
                    max_tokens: Integer,
                    messages: T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::Message],
                    model: String,
                    metadata: Sam::Models::Messages::BatchCreateParams::Request::Params::Metadata,
                    stop_sequences: T::Array[String],
                    stream: T::Boolean,
                    system_: T.any(String, T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1]),
                    temperature: Float,
                    thinking: T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigEnabled,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigDisabled
                    ),
                    tool_choice: T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAuto,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAny,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceTool,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceNone
                    ),
                    tools: T::Array[
                    T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124
                    )
                    ],
                    top_k: Integer,
                    top_p: Float
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
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
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
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                    )
                    ]
                  )
                )
                  .returns(
                    T.any(
                      String,
                      T::Array[
                      T.any(
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                      )
                      ]
                    )
                  )
              end
              def content=(_)
              end

              sig { returns(Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol)
                  .returns(Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol)
              end
              def role=(_)
              end

              sig do
                params(
                  content: T.any(
                    String,
                    T::Array[
                    T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                    )
                    ]
                  ),
                  role: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                        )
                        ]
                      ),
                      role: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol
                    }
                  )
              end
              def to_hash
              end

              module Content
                extend Sam::Union

                Variants =
                  type_template(:out) do
                    {
                      fixed: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                        )
                        ]
                      )
                    }
                  end

                UnionMember1Array =
                  T.let(
                    Sam::ArrayOf[union: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1],
                    Sam::Converter
                  )

                module UnionMember1
                  extend Sam::Union

                  Variants =
                    type_template(:out) do
                      {
                        fixed: T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestThinkingBlock,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                        )
                      }
                    end

                  class RequestTextBlock < Sam::BaseModel
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::CacheControl
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
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                          )
                          ]
                        )
                      )
                        .returns(
                          T.nilable(
                            T::Array[
                            T.any(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                        ),
                        citations: T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                            ),
                            citations: T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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

                    module Citation
                      extend Sam::Union

                      Variants =
                        type_template(:out) do
                          {
                            fixed: T.any(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                            )
                          }
                        end

                      class RequestCharLocationCitation < Sam::BaseModel
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

                      class RequestPageLocationCitation < Sam::BaseModel
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

                      class RequestContentBlockLocationCitation < Sam::BaseModel
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
                    end
                  end

                  class RequestImageBlock < Sam::BaseModel
                    sig do
                      returns(
                        T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        )
                      )
                    end
                    def source
                    end

                    sig do
                      params(
                        _: T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        )
                      )
                        .returns(
                          T.any(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                          )
                        )
                    end
                    def cache_control=(_)
                    end

                    sig do
                      params(
                        source: T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        ),
                        cache_control: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::CacheControl
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
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            ),
                            type: Symbol,
                            cache_control: T.nilable(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                            )
                          }
                        )
                    end
                    def to_hash
                    end

                    module Source
                      extend Sam::Union

                      Variants =
                        type_template(:out) do
                          {
                            fixed: T.any(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            )
                          }
                        end

                      class Base64ImageSource < Sam::BaseModel
                        sig { returns(String) }
                        def data
                        end

                        sig { params(_: String).returns(String) }
                        def data=(_)
                        end

                        sig do
                          returns(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                          )
                        end
                        def media_type
                        end

                        sig do
                          params(
                            _: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                          )
                            .returns(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                            )
                        end
                        def media_type=(_)
                        end

                        sig { returns(Symbol) }
                        def type
                        end

                        sig { params(_: Symbol).returns(Symbol) }
                        def type=(_)
                        end

                        sig do
                          params(
                            data: String,
                            media_type: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
                            type: Symbol
                          )
                            .returns(T.attached_class)
                        end
                        def self.new(data:, media_type:, type: :base64)
                        end

                        sig do
                          override
                            .returns(
                              {
                                data: String,
                                media_type: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
                                type: Symbol
                              }
                            )
                        end
                        def to_hash
                        end

                        module MediaType
                          extend Sam::Enum

                          TaggedSymbol =
                            T.type_alias do
                              T.all(Symbol, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType)
                            end
                          OrSymbol =
                            T.type_alias do
                              T.any(
                                Symbol,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                              )
                            end

                          IMAGE_JPEG =
                            T.let(
                              :"image/jpeg",
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                            )
                          IMAGE_PNG =
                            T.let(
                              :"image/png",
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                            )
                          IMAGE_GIF =
                            T.let(
                              :"image/gif",
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                            )
                          IMAGE_WEBP =
                            T.let(
                              :"image/webp",
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                            )
                        end
                      end

                      class URLImageSource < Sam::BaseModel
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

                  class RequestToolUseBlock < Sam::BaseModel
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
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
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
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

                  class RequestToolResultBlock < Sam::BaseModel
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
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
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                          )
                          ]
                        )
                      )
                        .returns(
                          T.any(
                            String,
                            T::Array[
                            T.any(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                        ),
                        content: T.any(
                          String,
                          T::Array[
                          T.any(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                            ),
                            content: T.any(
                              String,
                              T::Array[
                              T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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

                    module Content
                      extend Sam::Union

                      Variants =
                        type_template(:out) do
                          {
                            fixed: T.any(
                              String,
                              T::Array[
                              T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                              )
                              ]
                            )
                          }
                        end

                      UnionMember1Array =
                        T.let(
                          Sam::ArrayOf[
                          union: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1
                          ],
                          Sam::Converter
                        )

                      module UnionMember1
                        extend Sam::Union

                        Variants =
                          type_template(:out) do
                            {
                              fixed: T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                              )
                            }
                          end

                        class RequestTextBlock < Sam::BaseModel
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
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                              )
                            )
                          end
                          def cache_control
                          end

                          sig do
                            params(
                              _: T.nilable(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                              )
                            )
                              .returns(
                                T.nilable(
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
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
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                                )
                                ]
                              )
                            )
                              .returns(
                                T.nilable(
                                  T::Array[
                                  T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                              ),
                              citations: T.nilable(
                                T::Array[
                                T.any(
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                                  ),
                                  citations: T.nilable(
                                    T::Array[
                                    T.any(
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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

                          module Citation
                            extend Sam::Union

                            Variants =
                              type_template(:out) do
                                {
                                  fixed: T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                                  )
                                }
                              end

                            class RequestCharLocationCitation < Sam::BaseModel
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

                            class RequestPageLocationCitation < Sam::BaseModel
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

                            class RequestContentBlockLocationCitation < Sam::BaseModel
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
                          end
                        end

                        class RequestImageBlock < Sam::BaseModel
                          sig do
                            returns(
                              T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                              )
                            )
                          end
                          def source
                          end

                          sig do
                            params(
                              _: T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                              )
                            )
                              .returns(
                                T.any(
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
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
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                              )
                            )
                          end
                          def cache_control
                          end

                          sig do
                            params(
                              _: T.nilable(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                              )
                            )
                              .returns(
                                T.nilable(
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                                )
                              )
                          end
                          def cache_control=(_)
                          end

                          sig do
                            params(
                              source: T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                              ),
                              cache_control: T.nilable(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
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
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                  ),
                                  type: Symbol,
                                  cache_control: T.nilable(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                                  )
                                }
                              )
                          end
                          def to_hash
                          end

                          module Source
                            extend Sam::Union

                            Variants =
                              type_template(:out) do
                                {
                                  fixed: T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                  )
                                }
                              end

                            class Base64ImageSource < Sam::BaseModel
                              sig { returns(String) }
                              def data
                              end

                              sig { params(_: String).returns(String) }
                              def data=(_)
                              end

                              sig do
                                returns(
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                )
                              end
                              def media_type
                              end

                              sig do
                                params(
                                  _: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                )
                                  .returns(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                  )
                              end
                              def media_type=(_)
                              end

                              sig { returns(Symbol) }
                              def type
                              end

                              sig { params(_: Symbol).returns(Symbol) }
                              def type=(_)
                              end

                              sig do
                                params(
                                  data: String,
                                  media_type: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
                                  type: Symbol
                                )
                                  .returns(T.attached_class)
                              end
                              def self.new(data:, media_type:, type: :base64)
                              end

                              sig do
                                override
                                  .returns(
                                    {
                                      data: String,
                                      media_type: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
                                      type: Symbol
                                    }
                                  )
                              end
                              def to_hash
                              end

                              module MediaType
                                extend Sam::Enum

                                TaggedSymbol =
                                  T.type_alias do
                                    T.all(Symbol, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType)
                                  end
                                OrSymbol =
                                  T.type_alias do
                                    T.any(
                                      Symbol,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                    )
                                  end

                                IMAGE_JPEG =
                                  T.let(
                                    :"image/jpeg",
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                  )
                                IMAGE_PNG =
                                  T.let(
                                    :"image/png",
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                  )
                                IMAGE_GIF =
                                  T.let(
                                    :"image/gif",
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                  )
                                IMAGE_WEBP =
                                  T.let(
                                    :"image/webp",
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                  )
                              end
                            end

                            class URLImageSource < Sam::BaseModel
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
                      end
                    end
                  end

                  class RequestDocumentBlock < Sam::BaseModel
                    sig do
                      returns(
                        T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                        )
                      )
                    end
                    def source
                    end

                    sig do
                      params(
                        _: T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                        )
                      )
                        .returns(
                          T.any(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                          )
                        )
                    end
                    def cache_control=(_)
                    end

                    sig do
                      returns(
                        T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Citations
                        )
                      )
                    end
                    def citations
                    end

                    sig do
                      params(
                        _: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Citations
                      )
                        .returns(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Citations
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
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                        ),
                        cache_control: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                        ),
                        citations: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Citations,
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
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                            ),
                            type: Symbol,
                            cache_control: T.nilable(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                            ),
                            citations: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Citations,
                            context: T.nilable(String),
                            title: T.nilable(String)
                          }
                        )
                    end
                    def to_hash
                    end

                    module Source
                      extend Sam::Union

                      Variants =
                        type_template(:out) do
                          {
                            fixed: T.any(
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                              Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                            )
                          }
                        end

                      class Base64PdfSource < Sam::BaseModel
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
                        def self.new(data:, media_type: :"application/pdf", type: :base64)
                        end

                        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                        def to_hash
                        end
                      end

                      class PlainTextSource < Sam::BaseModel
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
                        def self.new(data:, media_type: :"text/plain", type: :text)
                        end

                        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                        def to_hash
                        end
                      end

                      class ContentBlockSource < Sam::BaseModel
                        sig do
                          returns(
                            T.any(
                              String,
                              T::Array[
                              T.any(
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                              )
                              ]
                            )
                          )
                            .returns(
                              T.any(
                                String,
                                T::Array[
                                T.any(
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                  Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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
                          extend Sam::Union

                          Variants =
                            type_template(:out) do
                              {
                                fixed: T.any(
                                  String,
                                  T::Array[
                                  T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                                  )
                                  ]
                                )
                              }
                            end

                          UnionMember1Array =
                            T.let(
                              Sam::ArrayOf[
                              union: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1
                              ],
                              Sam::Converter
                            )

                          module UnionMember1
                            extend Sam::Union

                            Variants =
                              type_template(:out) do
                                {
                                  fixed: T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                                  )
                                }
                              end

                            class RequestTextBlock < Sam::BaseModel
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
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                                  )
                                )
                              end
                              def cache_control
                              end

                              sig do
                                params(
                                  _: T.nilable(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                                  )
                                )
                                  .returns(
                                    T.nilable(
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
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
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                                    )
                                    ]
                                  )
                                )
                                  .returns(
                                    T.nilable(
                                      T::Array[
                                      T.any(
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                                  ),
                                  citations: T.nilable(
                                    T::Array[
                                    T.any(
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                                      ),
                                      citations: T.nilable(
                                        T::Array[
                                        T.any(
                                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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

                              module Citation
                                extend Sam::Union

                                Variants =
                                  type_template(:out) do
                                    {
                                      fixed: T.any(
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                                      )
                                    }
                                  end

                                class RequestCharLocationCitation < Sam::BaseModel
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

                                class RequestPageLocationCitation < Sam::BaseModel
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

                                class RequestContentBlockLocationCitation < Sam::BaseModel
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
                              end
                            end

                            class RequestImageBlock < Sam::BaseModel
                              sig do
                                returns(
                                  T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                  )
                                )
                              end
                              def source
                              end

                              sig do
                                params(
                                  _: T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                  )
                                )
                                  .returns(
                                    T.any(
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
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
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                                  )
                                )
                              end
                              def cache_control
                              end

                              sig do
                                params(
                                  _: T.nilable(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                                  )
                                )
                                  .returns(
                                    T.nilable(
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                                    )
                                  )
                              end
                              def cache_control=(_)
                              end

                              sig do
                                params(
                                  source: T.any(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                  ),
                                  cache_control: T.nilable(
                                    Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
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
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                      ),
                                      type: Symbol,
                                      cache_control: T.nilable(
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                                      )
                                    }
                                  )
                              end
                              def to_hash
                              end

                              module Source
                                extend Sam::Union

                                Variants =
                                  type_template(:out) do
                                    {
                                      fixed: T.any(
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                      )
                                    }
                                  end

                                class Base64ImageSource < Sam::BaseModel
                                  sig { returns(String) }
                                  def data
                                  end

                                  sig { params(_: String).returns(String) }
                                  def data=(_)
                                  end

                                  sig do
                                    returns(
                                      Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                    )
                                  end
                                  def media_type
                                  end

                                  sig do
                                    params(
                                      _: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                    )
                                      .returns(
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                      )
                                  end
                                  def media_type=(_)
                                  end

                                  sig { returns(Symbol) }
                                  def type
                                  end

                                  sig { params(_: Symbol).returns(Symbol) }
                                  def type=(_)
                                  end

                                  sig do
                                    params(
                                      data: String,
                                      media_type: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
                                      type: Symbol
                                    )
                                      .returns(T.attached_class)
                                  end
                                  def self.new(data:, media_type:, type: :base64)
                                  end

                                  sig do
                                    override
                                      .returns(
                                        {
                                          data: String,
                                          media_type: Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
                                          type: Symbol
                                        }
                                      )
                                  end
                                  def to_hash
                                  end

                                  module MediaType
                                    extend Sam::Enum

                                    TaggedSymbol =
                                      T.type_alias do
                                        T.all(Symbol, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType)
                                      end
                                    OrSymbol =
                                      T.type_alias do
                                        T.any(
                                          Symbol,
                                          Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                        )
                                      end

                                    IMAGE_JPEG =
                                      T.let(
                                        :"image/jpeg",
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                      )
                                    IMAGE_PNG =
                                      T.let(
                                        :"image/png",
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                      )
                                    IMAGE_GIF =
                                      T.let(
                                        :"image/gif",
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                      )
                                    IMAGE_WEBP =
                                      T.let(
                                        :"image/webp",
                                        Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                                      )
                                  end
                                end

                                class URLImageSource < Sam::BaseModel
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
                          end
                        end
                      end

                      class UrlpdfSource < Sam::BaseModel
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

                  class RequestThinkingBlock < Sam::BaseModel
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

                    sig do
                      params(signature: String, thinking: String, type: Symbol).returns(T.attached_class)
                    end
                    def self.new(signature:, thinking:, type: :thinking)
                    end

                    sig { override.returns({signature: String, thinking: String, type: Symbol}) }
                    def to_hash
                    end
                  end

                  class RequestRedactedThinkingBlock < Sam::BaseModel
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
                end
              end

              module Role
                extend Sam::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::TaggedSymbol) }

                USER = T.let(:user, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol)
                ASSISTANT =
                  T.let(:assistant, Sam::Models::Messages::BatchCreateParams::Request::Params::Message::Role::OrSymbol)
              end
            end

            class Metadata < Sam::BaseModel
              # An external identifier for the user who is associated with the request.
              #
              #   This should be a uuid, hash value, or other opaque identifier. Anthropic may use
              #   this id to help detect abuse. Do not include any identifying information such as
              #   name, email address, or phone number.
              sig { returns(T.nilable(String)) }
              def user_id
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def user_id=(_)
              end

              # An object describing metadata about the request.
              sig { params(user_id: T.nilable(String)).returns(T.attached_class) }
              def self.new(user_id: nil)
              end

              sig { override.returns({user_id: T.nilable(String)}) }
              def to_hash
              end
            end

            # System prompt.
            #
            #   A system prompt is a way of providing context and instructions to Claude, such
            #   as specifying a particular goal or role. See our
            #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
            module System
              extend Sam::Union

              Variants =
                type_template(:out) do
                  {
                    fixed: T.any(String, T::Array[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1])
                  }
                end

              UnionMember1Array =
                T.let(
                  Sam::ArrayOf[Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1],
                  Sam::Converter
                )

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

                sig do
                  returns(
                    T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::CacheControl)
                  )
                end
                def cache_control
                end

                sig do
                  params(
                    _: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::CacheControl)
                  )
                    .returns(
                      T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::CacheControl)
                    )
                end
                def cache_control=(_)
                end

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                      T.any(
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestCharLocationCitation,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestPageLocationCitation,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestContentBlockLocationCitation
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
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestCharLocationCitation,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestPageLocationCitation,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestContentBlockLocationCitation
                      )
                      ]
                    )
                  )
                    .returns(
                      T.nilable(
                        T::Array[
                        T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestCharLocationCitation,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestPageLocationCitation,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestContentBlockLocationCitation
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
                    cache_control: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::CacheControl),
                    citations: T.nilable(
                      T::Array[
                      T.any(
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestCharLocationCitation,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestPageLocationCitation,
                        Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestContentBlockLocationCitation
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
                        cache_control: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::CacheControl),
                        citations: T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestCharLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestPageLocationCitation,
                            Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestContentBlockLocationCitation
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

                module Citation
                  extend Sam::Union

                  Variants =
                    type_template(:out) do
                      {
                        fixed: T.any(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestCharLocationCitation,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestPageLocationCitation,
                          Sam::Models::Messages::BatchCreateParams::Request::Params::System::UnionMember1::Citation::RequestContentBlockLocationCitation
                        )
                      }
                    end

                  class RequestCharLocationCitation < Sam::BaseModel
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

                  class RequestPageLocationCitation < Sam::BaseModel
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

                  class RequestContentBlockLocationCitation < Sam::BaseModel
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
            module Thinking
              extend Sam::Union

              Variants =
                type_template(:out) do
                  {
                    fixed: T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigEnabled,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Thinking::ThinkingConfigDisabled
                    )
                  }
                end

              class ThinkingConfigEnabled < Sam::BaseModel
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

              class ThinkingConfigDisabled < Sam::BaseModel
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
            end

            # How the model should use the provided tools. The model can use a specific tool,
            #   any available tool, decide by itself, or not use tools at all.
            module ToolChoice
              extend Sam::Union

              Variants =
                type_template(:out) do
                  {
                    fixed: T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAuto,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceAny,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceTool,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::ToolChoice::ToolChoiceNone
                    )
                  }
                end

              class ToolChoiceAuto < Sam::BaseModel
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

              class ToolChoiceAny < Sam::BaseModel
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

              class ToolChoiceTool < Sam::BaseModel
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

              class ToolChoiceNone < Sam::BaseModel
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
            end

            module Tool
              extend Sam::Union

              Variants =
                type_template(:out) do
                  {
                    fixed: T.any(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124,
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124
                    )
                  }
                end

              class Tool < Sam::BaseModel
                # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
                #
                #   This defines the shape of the `input` that your tool accepts and that the model
                #   will produce.
                sig { returns(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::InputSchema) }
                def input_schema
                end

                sig do
                  params(_: Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::InputSchema)
                    .returns(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::InputSchema)
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

                sig { returns(T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::CacheControl)) }
                def cache_control
                end

                sig do
                  params(_: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::CacheControl))
                    .returns(T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::CacheControl))
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

                sig do
                  params(
                    input_schema: Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::InputSchema,
                    name: String,
                    cache_control: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::CacheControl),
                    description: String
                  )
                    .returns(T.attached_class)
                end
                def self.new(input_schema:, name:, cache_control: nil, description: nil)
                end

                sig do
                  override
                    .returns(
                      {
                        input_schema: Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::InputSchema,
                        name: String,
                        cache_control: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::Tool::CacheControl),
                        description: String
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
              end

              class BashTool20250124 < Sam::BaseModel
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
                    T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124::CacheControl)
                  )
                end
                def cache_control
                end

                sig do
                  params(
                    _: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124::CacheControl)
                  )
                    .returns(
                      T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124::CacheControl)
                    )
                end
                def cache_control=(_)
                end

                sig do
                  params(
                    cache_control: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124::CacheControl),
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
                        cache_control: T.nilable(Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::BashTool20250124::CacheControl)
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

              class TextEditor20250124 < Sam::BaseModel
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
                    T.nilable(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124::CacheControl
                    )
                  )
                end
                def cache_control
                end

                sig do
                  params(
                    _: T.nilable(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124::CacheControl
                    )
                  )
                    .returns(
                      T.nilable(
                        Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124::CacheControl
                      )
                    )
                end
                def cache_control=(_)
                end

                sig do
                  params(
                    cache_control: T.nilable(
                      Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124::CacheControl
                    ),
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
                        cache_control: T.nilable(
                          Sam::Models::Messages::BatchCreateParams::Request::Params::Tool::TextEditor20250124::CacheControl
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
            end
          end
        end
      end
    end
  end
end
