# typed: strong

module Sam
  module Models
    class MessageCreateParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # The maximum number of tokens to generate before stopping.
      #
      #   Note that our models may stop _before_ reaching this maximum. This parameter
      #   only specifies the absolute maximum number of tokens to generate.
      #
      #   Different models have different maximum values for this parameter. See
      #   [models](https://docs.anthropic.com/en/docs/models-overview) for details.
      sig { returns(Integer) }
      attr_accessor :max_tokens

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
      sig { returns(T::Array[Sam::Models::MessageCreateParams::Message]) }
      attr_accessor :messages

      # The model that will complete your prompt.
      #
      #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(String) }
      attr_accessor :model

      # An object describing metadata about the request.
      sig { returns(T.nilable(Sam::Models::MessageCreateParams::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: T.any(Sam::Models::MessageCreateParams::Metadata, Sam::Util::AnyHash)).void }
      attr_writer :metadata

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
      attr_reader :stop_sequences

      sig { params(stop_sequences: T::Array[String]).void }
      attr_writer :stop_sequences

      # Whether to incrementally stream the response using server-sent events.
      #
      #   See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
      #   details.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stream

      sig { params(stream: T::Boolean).void }
      attr_writer :stream

      # System prompt.
      #
      #   A system prompt is a way of providing context and instructions to Claude, such
      #   as specifying a particular goal or role. See our
      #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      sig { returns(T.nilable(T.any(String, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]))) }
      attr_reader :system_

      sig do
        params(
          system_: T.any(String, T::Array[T.any(Sam::Models::MessageCreateParams::System::UnionMember1, Sam::Util::AnyHash)])
        )
          .void
      end
      attr_writer :system_

      # Amount of randomness injected into the response.
      #
      #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #   for analytical / multiple choice, and closer to `1.0` for creative and
      #   generative tasks.
      #
      #   Note that even with `temperature` of `0.0`, the results will not be fully
      #   deterministic.
      sig { returns(T.nilable(Float)) }
      attr_reader :temperature

      sig { params(temperature: Float).void }
      attr_writer :temperature

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
              Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled,
              Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled
            )
          )
        )
      end
      attr_reader :thinking

      sig do
        params(
          thinking: T.any(
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled,
            Sam::Util::AnyHash,
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled
          )
        )
          .void
      end
      attr_writer :thinking

      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      sig do
        returns(
          T.nilable(
            T.any(
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto,
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny,
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool,
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone
            )
          )
        )
      end
      attr_reader :tool_choice

      sig do
        params(
          tool_choice: T.any(
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto,
            Sam::Util::AnyHash,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone
          )
        )
          .void
      end
      attr_writer :tool_choice

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
              Sam::Models::MessageCreateParams::Tool::Tool,
              Sam::Models::MessageCreateParams::Tool::BashTool20250124,
              Sam::Models::MessageCreateParams::Tool::TextEditor20250124
            )
            ]
          )
        )
      end
      attr_reader :tools

      sig do
        params(
          tools: T::Array[
          T.any(
            Sam::Models::MessageCreateParams::Tool::Tool,
            Sam::Util::AnyHash,
            Sam::Models::MessageCreateParams::Tool::BashTool20250124,
            Sam::Models::MessageCreateParams::Tool::TextEditor20250124
          )
          ]
        )
          .void
      end
      attr_writer :tools

      # Only sample from the top K options for each subsequent token.
      #
      #   Used to remove "long tail" low probability responses.
      #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #   Recommended for advanced use cases only. You usually only need to use
      #   `temperature`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

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
      attr_reader :top_p

      sig { params(top_p: Float).void }
      attr_writer :top_p

      # Optional header to specify the beta version(s) you want to use.
      #
      #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
      #   the header multiple times for each beta.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :anthropic_beta

      sig { params(anthropic_beta: T::Array[String]).void }
      attr_writer :anthropic_beta

      # The version of the Anthropic API you want to use.
      #
      #   Read more about versioning and our version history
      #   [here](https://docs.anthropic.com/en/api/versioning).
      sig { returns(T.nilable(String)) }
      attr_reader :anthropic_version

      sig { params(anthropic_version: String).void }
      attr_writer :anthropic_version

      # Your unique API key for authentication.
      #
      #   This key is required in the header of all API requests, to authenticate your
      #   account and access Anthropic's services. Get your API key through the
      #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #   Workspace.
      sig { returns(T.nilable(String)) }
      attr_reader :x_api_key

      sig { params(x_api_key: String).void }
      attr_writer :x_api_key

      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[T.any(Sam::Models::MessageCreateParams::Message, Sam::Util::AnyHash)],
          model: String,
          metadata: T.any(Sam::Models::MessageCreateParams::Metadata, Sam::Util::AnyHash),
          stop_sequences: T::Array[String],
          stream: T::Boolean,
          system_: T.any(String, T::Array[T.any(Sam::Models::MessageCreateParams::System::UnionMember1, Sam::Util::AnyHash)]),
          temperature: Float,
          thinking: T.any(
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled,
            Sam::Util::AnyHash,
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled
          ),
          tool_choice: T.any(
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto,
            Sam::Util::AnyHash,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Sam::Models::MessageCreateParams::Tool::Tool,
            Sam::Util::AnyHash,
            Sam::Models::MessageCreateParams::Tool::BashTool20250124,
            Sam::Models::MessageCreateParams::Tool::TextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          anthropic_beta: T::Array[String],
          anthropic_version: String,
          x_api_key: String,
          request_options: T.any(Sam::RequestOptions, Sam::Util::AnyHash)
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
        top_p: nil,
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
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock
              )
              ]
            )
          )
        end
        attr_accessor :content

        sig { returns(Sam::Models::MessageCreateParams::Message::Role::OrSymbol) }
        attr_accessor :role

        sig do
          params(
            content: T.any(
              String,
              T::Array[
              T.any(
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock,
                Sam::Util::AnyHash,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock,
                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock
              )
              ]
            ),
            role: Sam::Models::MessageCreateParams::Message::Role::OrSymbol
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                  )
                  ]
                ),
                role: Sam::Models::MessageCreateParams::Message::Role::OrSymbol
              }
            )
        end
        def to_hash
        end

        module Content
          extend Sam::Union

          UnionMember1Array =
            T.let(
              Sam::ArrayOf[union: Sam::Models::MessageCreateParams::Message::Content::UnionMember1],
              Sam::Converter
            )

          module UnionMember1
            extend Sam::Union

            class RequestTextBlock < Sam::BaseModel
              sig { returns(String) }
              attr_accessor :text

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  )
                )
                  .void
              end
              attr_writer :cache_control

              sig do
                returns(
                  T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                    )
                    ]
                  )
                )
              end
              attr_accessor :citations

              sig do
                params(
                  text: String,
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  ),
                  citations: T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                      Sam::Util::AnyHash,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                      ),
                      citations: T.nilable(
                        T::Array[
                        T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end

              module Citation
                extend Sam::Union

                class RequestCharLocationCitation < Sam::BaseModel
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

                sig do
                  override
                    .returns(
                      [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation]
                    )
                end
                def self.variants
                end
              end
            end

            class RequestImageBlock < Sam::BaseModel
              sig do
                returns(
                  T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                  )
                )
              end
              attr_accessor :source

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  )
                )
                  .void
              end
              attr_writer :cache_control

              sig do
                params(
                  source: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                    Sam::Util::AnyHash,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                  ),
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
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
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                      ),
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                      )
                    }
                  )
              end
              def to_hash
              end

              module Source
                extend Sam::Union

                class Base64ImageSource < Sam::BaseModel
                  sig { returns(String) }
                  attr_accessor :data

                  sig do
                    returns(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                    )
                  end
                  attr_accessor :media_type

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig do
                    params(
                      data: String,
                      media_type: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
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
                          media_type: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
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
                        T.all(Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType)
                      end
                    OrSymbol =
                      T.type_alias do
                        T.any(
                          Symbol,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                        )
                      end

                    IMAGE_JPEG =
                      T.let(
                        :"image/jpeg",
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                      )
                    IMAGE_PNG =
                      T.let(
                        :"image/png",
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                      )
                    IMAGE_GIF =
                      T.let(
                        :"image/gif",
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                      )
                    IMAGE_WEBP =
                      T.let(
                        :"image/webp",
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                      )

                    sig do
                      override
                        .returns(
                          T::Array[
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                          ]
                        )
                    end
                    def self.values
                    end
                  end
                end

                class URLImageSource < Sam::BaseModel
                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig { returns(String) }
                  attr_accessor :url

                  sig { params(url: String, type: Symbol).returns(T.attached_class) }
                  def self.new(url:, type: :url)
                  end

                  sig { override.returns({type: Symbol, url: String}) }
                  def to_hash
                  end
                end

                sig do
                  override
                    .returns(
                      [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                    )
                end
                def self.variants
                end
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                attr_accessor :type

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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  )
                )
                  .void
              end
              attr_writer :cache_control

              sig do
                params(
                  id: String,
                  input: T.anything,
                  name: String,
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
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
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
                      )
                    }
                  )
              end
              def to_hash
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                attr_accessor :type

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
              attr_accessor :tool_use_id

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  )
                )
                  .void
              end
              attr_writer :cache_control

              sig do
                returns(
                  T.nilable(
                    T.any(
                      String,
                      T::Array[
                      T.any(
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                      )
                      ]
                    )
                  )
                )
              end
              attr_reader :content

              sig do
                params(
                  content: T.any(
                    String,
                    T::Array[
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                      Sam::Util::AnyHash,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                    )
                    ]
                  )
                )
                  .void
              end
              attr_writer :content

              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_error

              sig { params(is_error: T::Boolean).void }
              attr_writer :is_error

              sig do
                params(
                  tool_use_id: String,
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  ),
                  content: T.any(
                    String,
                    T::Array[
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                      Sam::Util::AnyHash,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                      ),
                      content: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end

              module Content
                extend Sam::Union

                UnionMember1Array =
                  T.let(
                    Sam::ArrayOf[
                    union: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1
                    ],
                    Sam::Converter
                  )

                module UnionMember1
                  extend Sam::Union

                  class RequestTextBlock < Sam::BaseModel
                    sig { returns(String) }
                    attr_accessor :text

                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      returns(
                        T.nilable(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                        )
                      )
                    end
                    attr_reader :cache_control

                    sig do
                      params(
                        cache_control: T.nilable(
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl,
                            Sam::Util::AnyHash
                          )
                        )
                      )
                        .void
                    end
                    attr_writer :cache_control

                    sig do
                      returns(
                        T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                          )
                          ]
                        )
                      )
                    end
                    attr_accessor :citations

                    sig do
                      params(
                        text: String,
                        cache_control: T.nilable(
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl,
                            Sam::Util::AnyHash
                          )
                        ),
                        citations: T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Util::AnyHash,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                            ),
                            citations: T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                      attr_accessor :type

                      sig { params(type: Symbol).returns(T.attached_class) }
                      def self.new(type: :ephemeral)
                      end

                      sig { override.returns({type: Symbol}) }
                      def to_hash
                      end
                    end

                    module Citation
                      extend Sam::Union

                      class RequestCharLocationCitation < Sam::BaseModel
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

                      sig do
                        override
                          .returns(
                            [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation]
                          )
                      end
                      def self.variants
                      end
                    end
                  end

                  class RequestImageBlock < Sam::BaseModel
                    sig do
                      returns(
                        T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        )
                      )
                    end
                    attr_accessor :source

                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      returns(
                        T.nilable(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                        )
                      )
                    end
                    attr_reader :cache_control

                    sig do
                      params(
                        cache_control: T.nilable(
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl,
                            Sam::Util::AnyHash
                          )
                        )
                      )
                        .void
                    end
                    attr_writer :cache_control

                    sig do
                      params(
                        source: T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Util::AnyHash,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        ),
                        cache_control: T.nilable(
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl,
                            Sam::Util::AnyHash
                          )
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
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            ),
                            type: Symbol,
                            cache_control: T.nilable(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                            )
                          }
                        )
                    end
                    def to_hash
                    end

                    module Source
                      extend Sam::Union

                      class Base64ImageSource < Sam::BaseModel
                        sig { returns(String) }
                        attr_accessor :data

                        sig do
                          returns(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                          )
                        end
                        attr_accessor :media_type

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          params(
                            data: String,
                            media_type: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
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
                                media_type: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
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
                              T.all(Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType)
                            end
                          OrSymbol =
                            T.type_alias do
                              T.any(
                                Symbol,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                              )
                            end

                          IMAGE_JPEG =
                            T.let(
                              :"image/jpeg",
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                            )
                          IMAGE_PNG =
                            T.let(
                              :"image/png",
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                            )
                          IMAGE_GIF =
                            T.let(
                              :"image/gif",
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                            )
                          IMAGE_WEBP =
                            T.let(
                              :"image/webp",
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                            )

                          sig do
                            override
                              .returns(
                                T::Array[
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                ]
                              )
                          end
                          def self.values
                          end
                        end
                      end

                      class URLImageSource < Sam::BaseModel
                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig { returns(String) }
                        attr_accessor :url

                        sig { params(url: String, type: Symbol).returns(T.attached_class) }
                        def self.new(url:, type: :url)
                        end

                        sig { override.returns({type: Symbol, url: String}) }
                        def to_hash
                        end
                      end

                      sig do
                        override
                          .returns(
                            [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                          )
                      end
                      def self.variants
                      end
                    end

                    class CacheControl < Sam::BaseModel
                      sig { returns(Symbol) }
                      attr_accessor :type

                      sig { params(type: Symbol).returns(T.attached_class) }
                      def self.new(type: :ephemeral)
                      end

                      sig { override.returns({type: Symbol}) }
                      def to_hash
                      end
                    end
                  end

                  sig do
                    override
                      .returns(
                        [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock]
                      )
                  end
                  def self.variants
                  end
                end

                sig do
                  override
                    .returns(
                      [
                        String,
                        T::Array[
                                              T.any(
                                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                                              )
                                              ]
                      ]
                    )
                end
                def self.variants
                end
              end
            end

            class RequestDocumentBlock < Sam::BaseModel
              sig do
                returns(
                  T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                  )
                )
              end
              attr_accessor :source

              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                  )
                )
              end
              attr_reader :cache_control

              sig do
                params(
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  )
                )
                  .void
              end
              attr_writer :cache_control

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations
                  )
                )
              end
              attr_reader :citations

              sig do
                params(
                  citations: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations,
                    Sam::Util::AnyHash
                  )
                )
                  .void
              end
              attr_writer :citations

              sig { returns(T.nilable(String)) }
              attr_accessor :context

              sig { returns(T.nilable(String)) }
              attr_accessor :title

              sig do
                params(
                  source: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                    Sam::Util::AnyHash,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                  ),
                  cache_control: T.nilable(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl,
                      Sam::Util::AnyHash
                    )
                  ),
                  citations: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations,
                    Sam::Util::AnyHash
                  ),
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
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                      ),
                      type: Symbol,
                      cache_control: T.nilable(
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                      ),
                      citations: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations,
                      context: T.nilable(String),
                      title: T.nilable(String)
                    }
                  )
              end
              def to_hash
              end

              module Source
                extend Sam::Union

                class Base64PdfSource < Sam::BaseModel
                  sig { returns(String) }
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :media_type

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
                  def self.new(data:, media_type: :"application/pdf", type: :base64)
                  end

                  sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
                  def to_hash
                  end
                end

                class PlainTextSource < Sam::BaseModel
                  sig { returns(String) }
                  attr_accessor :data

                  sig { returns(Symbol) }
                  attr_accessor :media_type

                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
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
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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
                      content: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                          Sam::Util::AnyHash,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
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

                    UnionMember1Array =
                      T.let(
                        Sam::ArrayOf[
                        union: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1
                        ],
                        Sam::Converter
                      )

                    module UnionMember1
                      extend Sam::Union

                      class RequestTextBlock < Sam::BaseModel
                        sig { returns(String) }
                        attr_accessor :text

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          returns(
                            T.nilable(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                            )
                          )
                        end
                        attr_reader :cache_control

                        sig do
                          params(
                            cache_control: T.nilable(
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl,
                                Sam::Util::AnyHash
                              )
                            )
                          )
                            .void
                        end
                        attr_writer :cache_control

                        sig do
                          returns(
                            T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                              )
                              ]
                            )
                          )
                        end
                        attr_accessor :citations

                        sig do
                          params(
                            text: String,
                            cache_control: T.nilable(
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl,
                                Sam::Util::AnyHash
                              )
                            ),
                            citations: T.nilable(
                              T::Array[
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                Sam::Util::AnyHash,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                                ),
                                citations: T.nilable(
                                  T::Array[
                                  T.any(
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                          attr_accessor :type

                          sig { params(type: Symbol).returns(T.attached_class) }
                          def self.new(type: :ephemeral)
                          end

                          sig { override.returns({type: Symbol}) }
                          def to_hash
                          end
                        end

                        module Citation
                          extend Sam::Union

                          class RequestCharLocationCitation < Sam::BaseModel
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

                          sig do
                            override
                              .returns(
                                [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation]
                              )
                          end
                          def self.variants
                          end
                        end
                      end

                      class RequestImageBlock < Sam::BaseModel
                        sig do
                          returns(
                            T.any(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            )
                          )
                        end
                        attr_accessor :source

                        sig { returns(Symbol) }
                        attr_accessor :type

                        sig do
                          returns(
                            T.nilable(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                            )
                          )
                        end
                        attr_reader :cache_control

                        sig do
                          params(
                            cache_control: T.nilable(
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl,
                                Sam::Util::AnyHash
                              )
                            )
                          )
                            .void
                        end
                        attr_writer :cache_control

                        sig do
                          params(
                            source: T.any(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Util::AnyHash,
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            ),
                            cache_control: T.nilable(
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl,
                                Sam::Util::AnyHash
                              )
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
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                                ),
                                type: Symbol,
                                cache_control: T.nilable(
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                                )
                              }
                            )
                        end
                        def to_hash
                        end

                        module Source
                          extend Sam::Union

                          class Base64ImageSource < Sam::BaseModel
                            sig { returns(String) }
                            attr_accessor :data

                            sig do
                              returns(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol
                              )
                            end
                            attr_accessor :media_type

                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig do
                              params(
                                data: String,
                                media_type: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
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
                                    media_type: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::OrSymbol,
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
                                  T.all(Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType)
                                end
                              OrSymbol =
                                T.type_alias do
                                  T.any(
                                    Symbol,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                  )
                                end

                              IMAGE_JPEG =
                                T.let(
                                  :"image/jpeg",
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                )
                              IMAGE_PNG =
                                T.let(
                                  :"image/png",
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                )
                              IMAGE_GIF =
                                T.let(
                                  :"image/gif",
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                )
                              IMAGE_WEBP =
                                T.let(
                                  :"image/webp",
                                  Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                )

                              sig do
                                override
                                  .returns(
                                    T::Array[
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType::TaggedSymbol
                                    ]
                                  )
                              end
                              def self.values
                              end
                            end
                          end

                          class URLImageSource < Sam::BaseModel
                            sig { returns(Symbol) }
                            attr_accessor :type

                            sig { returns(String) }
                            attr_accessor :url

                            sig { params(url: String, type: Symbol).returns(T.attached_class) }
                            def self.new(url:, type: :url)
                            end

                            sig { override.returns({type: Symbol, url: String}) }
                            def to_hash
                            end
                          end

                          sig do
                            override
                              .returns(
                                [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                              )
                          end
                          def self.variants
                          end
                        end

                        class CacheControl < Sam::BaseModel
                          sig { returns(Symbol) }
                          attr_accessor :type

                          sig { params(type: Symbol).returns(T.attached_class) }
                          def self.new(type: :ephemeral)
                          end

                          sig { override.returns({type: Symbol}) }
                          def to_hash
                          end
                        end
                      end

                      sig do
                        override
                          .returns(
                            [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock]
                          )
                      end
                      def self.variants
                      end
                    end

                    sig do
                      override
                        .returns(
                          [
                            String,
                            T::Array[
                                                      T.any(
                                                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                                                      )
                                                      ]
                          ]
                        )
                    end
                    def self.variants
                    end
                  end
                end

                class UrlpdfSource < Sam::BaseModel
                  sig { returns(Symbol) }
                  attr_accessor :type

                  sig { returns(String) }
                  attr_accessor :url

                  sig { params(url: String, type: Symbol).returns(T.attached_class) }
                  def self.new(url:, type: :url)
                  end

                  sig { override.returns({type: Symbol, url: String}) }
                  def to_hash
                  end
                end

                sig do
                  override
                    .returns(
                      [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource]
                    )
                end
                def self.variants
                end
              end

              class CacheControl < Sam::BaseModel
                sig { returns(Symbol) }
                attr_accessor :type

                sig { params(type: Symbol).returns(T.attached_class) }
                def self.new(type: :ephemeral)
                end

                sig { override.returns({type: Symbol}) }
                def to_hash
                end
              end

              class Citations < Sam::BaseModel
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :enabled

                sig { params(enabled: T::Boolean).void }
                attr_writer :enabled

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
              attr_accessor :signature

              sig { returns(String) }
              attr_accessor :thinking

              sig { returns(Symbol) }
              attr_accessor :type

              sig { params(signature: String, thinking: String, type: Symbol).returns(T.attached_class) }
              def self.new(signature:, thinking:, type: :thinking)
              end

              sig { override.returns({signature: String, thinking: String, type: Symbol}) }
              def to_hash
              end
            end

            class RequestRedactedThinkingBlock < Sam::BaseModel
              sig { returns(String) }
              attr_accessor :data

              sig { returns(Symbol) }
              attr_accessor :type

              sig { params(data: String, type: Symbol).returns(T.attached_class) }
              def self.new(data:, type: :redacted_thinking)
              end

              sig { override.returns({data: String, type: Symbol}) }
              def to_hash
              end
            end

            sig do
              override
                .returns(
                  [Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock]
                )
            end
            def self.variants
            end
          end

          sig do
            override
              .returns(
                [
                  String,
                  T::Array[
                                  T.any(
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock,
                                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock
                                  )
                                  ]
                ]
              )
          end
          def self.variants
          end
        end

        module Role
          extend Sam::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Sam::Models::MessageCreateParams::Message::Role) }
          OrSymbol = T.type_alias { T.any(Symbol, Sam::Models::MessageCreateParams::Message::Role::TaggedSymbol) }

          USER = T.let(:user, Sam::Models::MessageCreateParams::Message::Role::TaggedSymbol)
          ASSISTANT = T.let(:assistant, Sam::Models::MessageCreateParams::Message::Role::TaggedSymbol)

          sig { override.returns(T::Array[Sam::Models::MessageCreateParams::Message::Role::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class Metadata < Sam::BaseModel
        # An external identifier for the user who is associated with the request.
        #
        #   This should be a uuid, hash value, or other opaque identifier. Anthropic may use
        #   this id to help detect abuse. Do not include any identifying information such as
        #   name, email address, or phone number.
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

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

        UnionMember1Array =
          T.let(Sam::ArrayOf[Sam::Models::MessageCreateParams::System::UnionMember1], Sam::Converter)

        class UnionMember1 < Sam::BaseModel
          sig { returns(String) }
          attr_accessor :text

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl)) }
          attr_reader :cache_control

          sig do
            params(
              cache_control: T.nilable(T.any(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl, Sam::Util::AnyHash))
            )
              .void
          end
          attr_writer :cache_control

          sig do
            returns(
              T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation,
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestPageLocationCitation,
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation
                )
                ]
              )
            )
          end
          attr_accessor :citations

          sig do
            params(
              text: String,
              cache_control: T.nilable(T.any(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl, Sam::Util::AnyHash)),
              citations: T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation,
                  Sam::Util::AnyHash,
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestPageLocationCitation,
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation
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
                  cache_control: T.nilable(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl),
                  citations: T.nilable(
                    T::Array[
                    T.any(
                      Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation,
                      Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestPageLocationCitation,
                      Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation
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
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end

          module Citation
            extend Sam::Union

            class RequestCharLocationCitation < Sam::BaseModel
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

            sig do
              override
                .returns(
                  [Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation, Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestPageLocationCitation, Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation]
                )
            end
            def self.variants
            end
          end
        end

        sig { override.returns([String, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]]) }
        def self.variants
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
          attr_accessor :budget_tokens

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(budget_tokens: Integer, type: Symbol).returns(T.attached_class) }
          def self.new(budget_tokens:, type: :enabled)
          end

          sig { override.returns({budget_tokens: Integer, type: Symbol}) }
          def to_hash
          end
        end

        class ThinkingConfigDisabled < Sam::BaseModel
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :disabled)
          end

          sig { override.returns({type: Symbol}) }
          def to_hash
          end
        end

        sig do
          override
            .returns(
              [Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled, Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled]
            )
        end
        def self.variants
        end
      end

      # How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      module ToolChoice
        extend Sam::Union

        class ToolChoiceAuto < Sam::BaseModel
          sig { returns(Symbol) }
          attr_accessor :type

          # Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output at most one tool
          #   use.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :disable_parallel_tool_use

          sig { params(disable_parallel_tool_use: T::Boolean).void }
          attr_writer :disable_parallel_tool_use

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
          attr_accessor :type

          # Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output exactly one tool
          #   use.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :disable_parallel_tool_use

          sig { params(disable_parallel_tool_use: T::Boolean).void }
          attr_writer :disable_parallel_tool_use

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
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          # Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output exactly one tool
          #   use.
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
          def self.new(name:, disable_parallel_tool_use: nil, type: :tool)
          end

          sig { override.returns({name: String, type: Symbol, disable_parallel_tool_use: T::Boolean}) }
          def to_hash
          end
        end

        class ToolChoiceNone < Sam::BaseModel
          sig { returns(Symbol) }
          attr_accessor :type

          # The model will not be allowed to use tools.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :none)
          end

          sig { override.returns({type: Symbol}) }
          def to_hash
          end
        end

        sig do
          override
            .returns(
              [Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone]
            )
        end
        def self.variants
        end
      end

      module Tool
        extend Sam::Union

        class Tool < Sam::BaseModel
          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          #   This defines the shape of the `input` that your tool accepts and that the model
          #   will produce.
          sig { returns(Sam::Models::MessageCreateParams::Tool::Tool::InputSchema) }
          attr_reader :input_schema

          sig do
            params(input_schema: T.any(Sam::Models::MessageCreateParams::Tool::Tool::InputSchema, Sam::Util::AnyHash))
              .void
          end
          attr_writer :input_schema

          # Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl)) }
          attr_reader :cache_control

          sig do
            params(
              cache_control: T.nilable(T.any(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl, Sam::Util::AnyHash))
            )
              .void
          end
          attr_writer :cache_control

          # Description of what this tool does.
          #
          #   Tool descriptions should be as detailed as possible. The more information that
          #   the model has about what the tool is and how to use it, the better it will
          #   perform. You can use natural language descriptions to reinforce important
          #   aspects of the tool input JSON schema.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig do
            params(
              input_schema: T.any(Sam::Models::MessageCreateParams::Tool::Tool::InputSchema, Sam::Util::AnyHash),
              name: String,
              cache_control: T.nilable(T.any(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl, Sam::Util::AnyHash)),
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
                  input_schema: Sam::Models::MessageCreateParams::Tool::Tool::InputSchema,
                  name: String,
                  cache_control: T.nilable(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl),
                  description: String
                }
              )
          end
          def to_hash
          end

          class InputSchema < Sam::BaseModel
            sig { returns(Symbol) }
            attr_accessor :type

            sig { returns(T.nilable(T.anything)) }
            attr_accessor :properties

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
            attr_accessor :type

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
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl)) }
          attr_reader :cache_control

          sig do
            params(
              cache_control: T.nilable(
                T.any(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl, Sam::Util::AnyHash)
              )
            )
              .void
          end
          attr_writer :cache_control

          sig do
            params(
              cache_control: T.nilable(
                T.any(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl, Sam::Util::AnyHash)
              ),
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
                  cache_control: T.nilable(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            attr_accessor :type

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
          attr_accessor :name

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl)) }
          attr_reader :cache_control

          sig do
            params(
              cache_control: T.nilable(
                T.any(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl, Sam::Util::AnyHash)
              )
            )
              .void
          end
          attr_writer :cache_control

          sig do
            params(
              cache_control: T.nilable(
                T.any(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl, Sam::Util::AnyHash)
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
                  cache_control: T.nilable(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl)
                }
              )
          end
          def to_hash
          end

          class CacheControl < Sam::BaseModel
            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :ephemeral)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end
        end

        sig do
          override
            .returns(
              [Sam::Models::MessageCreateParams::Tool::Tool, Sam::Models::MessageCreateParams::Tool::BashTool20250124, Sam::Models::MessageCreateParams::Tool::TextEditor20250124]
            )
        end
        def self.variants
        end
      end
    end
  end
end
