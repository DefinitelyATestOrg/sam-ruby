# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::Messages#count_tokens
    class MessageCountTokensParams < Sam::Internal::Type::BaseModel
      extend Sam::Internal::Type::RequestParameters::Converter
      include Sam::Internal::Type::RequestParameters

      # @!attribute messages
      #   Input messages.
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
      #
      #   @return [Array<Sam::Models::MessageCountTokensParams::Message>]
      required :messages, -> { Sam::Internal::Type::ArrayOf[Sam::Models::MessageCountTokensParams::Message] }

      # @!attribute model
      #   The model that will complete your prompt.
      #
      #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      #
      #   @return [String]
      required :model, String

      # @!attribute system_
      #   System prompt.
      #
      #   A system prompt is a way of providing context and instructions to Claude, such
      #   as specifying a particular goal or role. See our
      #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      #
      #   @return [String, Array<Sam::Models::MessageCountTokensParams::System::UnionMember1>, nil]
      optional :system_, union: -> { Sam::Models::MessageCountTokensParams::System }, api_name: :system

      # @!attribute thinking
      #   Configuration for enabling Claude's extended thinking.
      #
      #   When enabled, responses include `thinking` content blocks showing Claude's
      #   thinking process before the final answer. Requires a minimum budget of 1,024
      #   tokens and counts towards your `max_tokens` limit.
      #
      #   See
      #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      #
      #   @return [Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled, Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigDisabled, nil]
      optional :thinking, union: -> { Sam::Models::MessageCountTokensParams::Thinking }

      # @!attribute tool_choice
      #   How the model should use the provided tools. The model can use a specific tool,
      #   any available tool, decide by itself, or not use tools at all.
      #
      #   @return [Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceNone, nil]
      optional :tool_choice, union: -> { Sam::Models::MessageCountTokensParams::ToolChoice }

      # @!attribute tools
      #   Definitions of tools that the model may use.
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
      #
      #   @return [Array<Sam::Models::MessageCountTokensParams::Tool::Tool, Sam::Models::MessageCountTokensParams::Tool::BashTool20250124, Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124>, nil]
      optional :tools, -> { Sam::Internal::Type::ArrayOf[union: Sam::Models::MessageCountTokensParams::Tool] }

      # @!attribute anthropic_beta
      #   Optional header to specify the beta version(s) you want to use.
      #
      #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
      #   the header multiple times for each beta.
      #
      #   @return [Array<String>, nil]
      optional :anthropic_beta, Sam::Internal::Type::ArrayOf[String]

      # @!attribute anthropic_version
      #   The version of the Anthropic API you want to use.
      #
      #   Read more about versioning and our version history
      #   [here](https://docs.anthropic.com/en/api/versioning).
      #
      #   @return [String, nil]
      optional :anthropic_version, String

      # @!attribute x_api_key
      #   Your unique API key for authentication.
      #
      #   This key is required in the header of all API requests, to authenticate your
      #   account and access Anthropic's services. Get your API key through the
      #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #   Workspace.
      #
      #   @return [String, nil]
      optional :x_api_key, String

      # @!method initialize(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sam::Models::MessageCountTokensParams} for more details.
      #
      #   @param messages [Array<Sam::Models::MessageCountTokensParams::Message>] Input messages. ...
      #
      #   @param model [String] The model that will complete your prompt. ...
      #
      #   @param system_ [String, Array<Sam::Models::MessageCountTokensParams::System::UnionMember1>] System prompt. ...
      #
      #   @param thinking [Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled, Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigDisabled] Configuration for enabling Claude's extended thinking. ...
      #
      #   @param tool_choice [Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
      #   ...
      #
      #   @param tools [Array<Sam::Models::MessageCountTokensParams::Tool::Tool, Sam::Models::MessageCountTokensParams::Tool::BashTool20250124, Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124>] Definitions of tools that the model may use. ...
      #
      #   @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use. ...
      #
      #   @param anthropic_version [String] The version of the Anthropic API you want to use. ...
      #
      #   @param x_api_key [String] Your unique API key for authentication. ...
      #
      #   @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]

      class Message < Sam::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestThinkingBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock>]
        required :content, union: -> { Sam::Models::MessageCountTokensParams::Message::Content }

        # @!attribute role
        #
        #   @return [Symbol, Sam::Models::MessageCountTokensParams::Message::Role]
        required :role, enum: -> { Sam::Models::MessageCountTokensParams::Message::Role }

        # @!method initialize(content:, role:)
        #   @param content [String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestThinkingBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock>]
        #   @param role [Symbol, Sam::Models::MessageCountTokensParams::Message::Role]

        # @see Sam::Models::MessageCountTokensParams::Message#content
        module Content
          extend Sam::Internal::Type::Union

          variant String

          variant -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1Array }

          module UnionMember1
            extend Sam::Internal::Type::Union

            discriminator :type

            variant :text,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock }

            variant :image,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock }

            variant :tool_use,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock }

            variant :tool_result,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock }

            variant :document,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock }

            variant :thinking,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestThinkingBlock }

            variant :redacted_thinking,
                    -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock }

            class RequestTextBlock < Sam::Internal::Type::BaseModel
              # @!attribute text
              #
              #   @return [String]
              required :text, String

              # @!attribute type
              #
              #   @return [Symbol, :text]
              required :type, const: :text

              # @!attribute cache_control
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl, nil]
              optional :cache_control,
                       -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl },
                       nil?: true

              # @!attribute citations
              #
              #   @return [Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation>, nil]
              optional :citations,
                       -> { Sam::Internal::Type::ArrayOf[union: Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation] },
                       nil?: true

              # @!method initialize(text:, cache_control: nil, citations: nil, type: :text)
              #   @param text [String]
              #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl, nil]
              #   @param citations [Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation>, nil]
              #   @param type [Symbol, :text]

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock#cache_control
              class CacheControl < Sam::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [Symbol, :ephemeral]
                required :type, const: :ephemeral

                # @!method initialize(type: :ephemeral)
                #   @param type [Symbol, :ephemeral]
              end

              module Citation
                extend Sam::Internal::Type::Union

                discriminator :type

                variant :char_location,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation }

                variant :page_location,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation }

                variant :content_block_location,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation }

                class RequestCharLocationCitation < Sam::Internal::Type::BaseModel
                  # @!attribute cited_text
                  #
                  #   @return [String]
                  required :cited_text, String

                  # @!attribute document_index
                  #
                  #   @return [Integer]
                  required :document_index, Integer

                  # @!attribute document_title
                  #
                  #   @return [String, nil]
                  required :document_title, String, nil?: true

                  # @!attribute end_char_index
                  #
                  #   @return [Integer]
                  required :end_char_index, Integer

                  # @!attribute start_char_index
                  #
                  #   @return [Integer]
                  required :start_char_index, Integer

                  # @!attribute type
                  #
                  #   @return [Symbol, :char_location]
                  required :type, const: :char_location

                  # @!method initialize(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
                  #   @param cited_text [String]
                  #   @param document_index [Integer]
                  #   @param document_title [String, nil]
                  #   @param end_char_index [Integer]
                  #   @param start_char_index [Integer]
                  #   @param type [Symbol, :char_location]
                end

                class RequestPageLocationCitation < Sam::Internal::Type::BaseModel
                  # @!attribute cited_text
                  #
                  #   @return [String]
                  required :cited_text, String

                  # @!attribute document_index
                  #
                  #   @return [Integer]
                  required :document_index, Integer

                  # @!attribute document_title
                  #
                  #   @return [String, nil]
                  required :document_title, String, nil?: true

                  # @!attribute end_page_number
                  #
                  #   @return [Integer]
                  required :end_page_number, Integer

                  # @!attribute start_page_number
                  #
                  #   @return [Integer]
                  required :start_page_number, Integer

                  # @!attribute type
                  #
                  #   @return [Symbol, :page_location]
                  required :type, const: :page_location

                  # @!method initialize(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
                  #   @param cited_text [String]
                  #   @param document_index [Integer]
                  #   @param document_title [String, nil]
                  #   @param end_page_number [Integer]
                  #   @param start_page_number [Integer]
                  #   @param type [Symbol, :page_location]
                end

                class RequestContentBlockLocationCitation < Sam::Internal::Type::BaseModel
                  # @!attribute cited_text
                  #
                  #   @return [String]
                  required :cited_text, String

                  # @!attribute document_index
                  #
                  #   @return [Integer]
                  required :document_index, Integer

                  # @!attribute document_title
                  #
                  #   @return [String, nil]
                  required :document_title, String, nil?: true

                  # @!attribute end_block_index
                  #
                  #   @return [Integer]
                  required :end_block_index, Integer

                  # @!attribute start_block_index
                  #
                  #   @return [Integer]
                  required :start_block_index, Integer

                  # @!attribute type
                  #
                  #   @return [Symbol, :content_block_location]
                  required :type, const: :content_block_location

                  # @!method initialize(cited_text:, document_index:, document_title:, end_block_index:, start_block_index:, type: :content_block_location)
                  #   @param cited_text [String]
                  #   @param document_index [Integer]
                  #   @param document_title [String, nil]
                  #   @param end_block_index [Integer]
                  #   @param start_block_index [Integer]
                  #   @param type [Symbol, :content_block_location]
                end

                # @!method self.variants
                #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation)]
              end
            end

            class RequestImageBlock < Sam::Internal::Type::BaseModel
              # @!attribute source
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
              required :source,
                       union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source }

              # @!attribute type
              #
              #   @return [Symbol, :image]
              required :type, const: :image

              # @!attribute cache_control
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl, nil]
              optional :cache_control,
                       -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl },
                       nil?: true

              # @!method initialize(source:, cache_control: nil, type: :image)
              #   @param source [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
              #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl, nil]
              #   @param type [Symbol, :image]

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock#source
              module Source
                extend Sam::Internal::Type::Union

                discriminator :type

                variant :base64,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource }

                variant :url,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource }

                class Base64ImageSource < Sam::Internal::Type::BaseModel
                  # @!attribute data
                  #
                  #   @return [String]
                  required :data, String

                  # @!attribute media_type
                  #
                  #   @return [Symbol, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType]
                  required :media_type,
                           enum: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType }

                  # @!attribute type
                  #
                  #   @return [Symbol, :base64]
                  required :type, const: :base64

                  # @!method initialize(data:, media_type:, type: :base64)
                  #   @param data [String]
                  #   @param media_type [Symbol, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType]
                  #   @param type [Symbol, :base64]

                  # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource#media_type
                  module MediaType
                    extend Sam::Internal::Type::Enum

                    IMAGE_JPEG = :"image/jpeg"
                    IMAGE_PNG = :"image/png"
                    IMAGE_GIF = :"image/gif"
                    IMAGE_WEBP = :"image/webp"

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                class URLImageSource < Sam::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :url]
                  required :type, const: :url

                  # @!attribute url
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :url)
                  #   @param url [String]
                  #   @param type [Symbol, :url]
                end

                # @!method self.variants
                #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource)]
              end

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock#cache_control
              class CacheControl < Sam::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [Symbol, :ephemeral]
                required :type, const: :ephemeral

                # @!method initialize(type: :ephemeral)
                #   @param type [Symbol, :ephemeral]
              end
            end

            class RequestToolUseBlock < Sam::Internal::Type::BaseModel
              # @!attribute id
              #
              #   @return [String]
              required :id, String

              # @!attribute input
              #
              #   @return [Object]
              required :input, Sam::Internal::Type::Unknown

              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute type
              #
              #   @return [Symbol, :tool_use]
              required :type, const: :tool_use

              # @!attribute cache_control
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl, nil]
              optional :cache_control,
                       -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl },
                       nil?: true

              # @!method initialize(id:, input:, name:, cache_control: nil, type: :tool_use)
              #   @param id [String]
              #   @param input [Object]
              #   @param name [String]
              #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl, nil]
              #   @param type [Symbol, :tool_use]

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock#cache_control
              class CacheControl < Sam::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [Symbol, :ephemeral]
                required :type, const: :ephemeral

                # @!method initialize(type: :ephemeral)
                #   @param type [Symbol, :ephemeral]
              end
            end

            class RequestToolResultBlock < Sam::Internal::Type::BaseModel
              # @!attribute tool_use_id
              #
              #   @return [String]
              required :tool_use_id, String

              # @!attribute type
              #
              #   @return [Symbol, :tool_result]
              required :type, const: :tool_result

              # @!attribute cache_control
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl, nil]
              optional :cache_control,
                       -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl },
                       nil?: true

              # @!attribute content
              #
              #   @return [String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock>, nil]
              optional :content,
                       union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content }

              # @!attribute is_error
              #
              #   @return [Boolean, nil]
              optional :is_error, Sam::Internal::Type::Boolean

              # @!method initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
              #   @param tool_use_id [String]
              #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl, nil]
              #   @param content [String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock>]
              #   @param is_error [Boolean]
              #   @param type [Symbol, :tool_result]

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock#cache_control
              class CacheControl < Sam::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [Symbol, :ephemeral]
                required :type, const: :ephemeral

                # @!method initialize(type: :ephemeral)
                #   @param type [Symbol, :ephemeral]
              end

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock#content
              module Content
                extend Sam::Internal::Type::Union

                variant String

                variant -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1Array }

                module UnionMember1
                  extend Sam::Internal::Type::Union

                  discriminator :type

                  variant :text,
                          -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock }

                  variant :image,
                          -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock }

                  class RequestTextBlock < Sam::Internal::Type::BaseModel
                    # @!attribute text
                    #
                    #   @return [String]
                    required :text, String

                    # @!attribute type
                    #
                    #   @return [Symbol, :text]
                    required :type, const: :text

                    # @!attribute cache_control
                    #
                    #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl, nil]
                    optional :cache_control,
                             -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl },
                             nil?: true

                    # @!attribute citations
                    #
                    #   @return [Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation>, nil]
                    optional :citations,
                             -> do
                               Sam::Internal::Type::ArrayOf[
                                 union: Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation
                               ]
                             end,
                             nil?: true

                    # @!method initialize(text:, cache_control: nil, citations: nil, type: :text)
                    #   @param text [String]
                    #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl, nil]
                    #   @param citations [Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation>, nil]
                    #   @param type [Symbol, :text]

                    # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock#cache_control
                    class CacheControl < Sam::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :ephemeral]
                      required :type, const: :ephemeral

                      # @!method initialize(type: :ephemeral)
                      #   @param type [Symbol, :ephemeral]
                    end

                    module Citation
                      extend Sam::Internal::Type::Union

                      discriminator :type

                      variant :char_location,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation }

                      variant :page_location,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation }

                      variant :content_block_location,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation }

                      class RequestCharLocationCitation < Sam::Internal::Type::BaseModel
                        # @!attribute cited_text
                        #
                        #   @return [String]
                        required :cited_text, String

                        # @!attribute document_index
                        #
                        #   @return [Integer]
                        required :document_index, Integer

                        # @!attribute document_title
                        #
                        #   @return [String, nil]
                        required :document_title, String, nil?: true

                        # @!attribute end_char_index
                        #
                        #   @return [Integer]
                        required :end_char_index, Integer

                        # @!attribute start_char_index
                        #
                        #   @return [Integer]
                        required :start_char_index, Integer

                        # @!attribute type
                        #
                        #   @return [Symbol, :char_location]
                        required :type, const: :char_location

                        # @!method initialize(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
                        #   @param cited_text [String]
                        #   @param document_index [Integer]
                        #   @param document_title [String, nil]
                        #   @param end_char_index [Integer]
                        #   @param start_char_index [Integer]
                        #   @param type [Symbol, :char_location]
                      end

                      class RequestPageLocationCitation < Sam::Internal::Type::BaseModel
                        # @!attribute cited_text
                        #
                        #   @return [String]
                        required :cited_text, String

                        # @!attribute document_index
                        #
                        #   @return [Integer]
                        required :document_index, Integer

                        # @!attribute document_title
                        #
                        #   @return [String, nil]
                        required :document_title, String, nil?: true

                        # @!attribute end_page_number
                        #
                        #   @return [Integer]
                        required :end_page_number, Integer

                        # @!attribute start_page_number
                        #
                        #   @return [Integer]
                        required :start_page_number, Integer

                        # @!attribute type
                        #
                        #   @return [Symbol, :page_location]
                        required :type, const: :page_location

                        # @!method initialize(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
                        #   @param cited_text [String]
                        #   @param document_index [Integer]
                        #   @param document_title [String, nil]
                        #   @param end_page_number [Integer]
                        #   @param start_page_number [Integer]
                        #   @param type [Symbol, :page_location]
                      end

                      class RequestContentBlockLocationCitation < Sam::Internal::Type::BaseModel
                        # @!attribute cited_text
                        #
                        #   @return [String]
                        required :cited_text, String

                        # @!attribute document_index
                        #
                        #   @return [Integer]
                        required :document_index, Integer

                        # @!attribute document_title
                        #
                        #   @return [String, nil]
                        required :document_title, String, nil?: true

                        # @!attribute end_block_index
                        #
                        #   @return [Integer]
                        required :end_block_index, Integer

                        # @!attribute start_block_index
                        #
                        #   @return [Integer]
                        required :start_block_index, Integer

                        # @!attribute type
                        #
                        #   @return [Symbol, :content_block_location]
                        required :type, const: :content_block_location

                        # @!method initialize(cited_text:, document_index:, document_title:, end_block_index:, start_block_index:, type: :content_block_location)
                        #   @param cited_text [String]
                        #   @param document_index [Integer]
                        #   @param document_title [String, nil]
                        #   @param end_block_index [Integer]
                        #   @param start_block_index [Integer]
                        #   @param type [Symbol, :content_block_location]
                      end

                      # @!method self.variants
                      #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation)]
                    end
                  end

                  class RequestImageBlock < Sam::Internal::Type::BaseModel
                    # @!attribute source
                    #
                    #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                    required :source,
                             union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source }

                    # @!attribute type
                    #
                    #   @return [Symbol, :image]
                    required :type, const: :image

                    # @!attribute cache_control
                    #
                    #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl, nil]
                    optional :cache_control,
                             -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl },
                             nil?: true

                    # @!method initialize(source:, cache_control: nil, type: :image)
                    #   @param source [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                    #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl, nil]
                    #   @param type [Symbol, :image]

                    # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock#source
                    module Source
                      extend Sam::Internal::Type::Union

                      discriminator :type

                      variant :base64,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource }

                      variant :url,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource }

                      class Base64ImageSource < Sam::Internal::Type::BaseModel
                        # @!attribute data
                        #
                        #   @return [String]
                        required :data, String

                        # @!attribute media_type
                        #
                        #   @return [Symbol, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType]
                        required :media_type,
                                 enum: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType }

                        # @!attribute type
                        #
                        #   @return [Symbol, :base64]
                        required :type, const: :base64

                        # @!method initialize(data:, media_type:, type: :base64)
                        #   @param data [String]
                        #   @param media_type [Symbol, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType]
                        #   @param type [Symbol, :base64]

                        # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource#media_type
                        module MediaType
                          extend Sam::Internal::Type::Enum

                          IMAGE_JPEG = :"image/jpeg"
                          IMAGE_PNG = :"image/png"
                          IMAGE_GIF = :"image/gif"
                          IMAGE_WEBP = :"image/webp"

                          # @!method self.values
                          #   @return [Array<Symbol>]
                        end
                      end

                      class URLImageSource < Sam::Internal::Type::BaseModel
                        # @!attribute type
                        #
                        #   @return [Symbol, :url]
                        required :type, const: :url

                        # @!attribute url
                        #
                        #   @return [String]
                        required :url, String

                        # @!method initialize(url:, type: :url)
                        #   @param url [String]
                        #   @param type [Symbol, :url]
                      end

                      # @!method self.variants
                      #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource)]
                    end

                    # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock#cache_control
                    class CacheControl < Sam::Internal::Type::BaseModel
                      # @!attribute type
                      #
                      #   @return [Symbol, :ephemeral]
                      required :type, const: :ephemeral

                      # @!method initialize(type: :ephemeral)
                      #   @param type [Symbol, :ephemeral]
                    end
                  end

                  # @!method self.variants
                  #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock)]
                end

                # @!method self.variants
                #   @return [Array(String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock>)]

                UnionMember1Array =
                  Sam::Internal::Type::ArrayOf[
                    union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1 }
                  ]
              end
            end

            class RequestDocumentBlock < Sam::Internal::Type::BaseModel
              # @!attribute source
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource]
              required :source,
                       union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source }

              # @!attribute type
              #
              #   @return [Symbol, :document]
              required :type, const: :document

              # @!attribute cache_control
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl, nil]
              optional :cache_control,
                       -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl },
                       nil?: true

              # @!attribute citations
              #
              #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations, nil]
              optional :citations,
                       -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations }

              # @!attribute context
              #
              #   @return [String, nil]
              optional :context, String, nil?: true

              # @!attribute title
              #
              #   @return [String, nil]
              optional :title, String, nil?: true

              # @!method initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
              #   @param source [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource]
              #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl, nil]
              #   @param citations [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations]
              #   @param context [String, nil]
              #   @param title [String, nil]
              #   @param type [Symbol, :document]

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock#source
              module Source
                extend Sam::Internal::Type::Union

                discriminator :type

                variant :base64,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource }

                variant :text,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource }

                variant :content,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource }

                variant :url,
                        -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource }

                class Base64PdfSource < Sam::Internal::Type::BaseModel
                  # @!attribute data
                  #
                  #   @return [String]
                  required :data, String

                  # @!attribute media_type
                  #
                  #   @return [Symbol, :"application/pdf"]
                  required :media_type, const: :"application/pdf"

                  # @!attribute type
                  #
                  #   @return [Symbol, :base64]
                  required :type, const: :base64

                  # @!method initialize(data:, media_type: :"application/pdf", type: :base64)
                  #   @param data [String]
                  #   @param media_type [Symbol, :"application/pdf"]
                  #   @param type [Symbol, :base64]
                end

                class PlainTextSource < Sam::Internal::Type::BaseModel
                  # @!attribute data
                  #
                  #   @return [String]
                  required :data, String

                  # @!attribute media_type
                  #
                  #   @return [Symbol, :"text/plain"]
                  required :media_type, const: :"text/plain"

                  # @!attribute type
                  #
                  #   @return [Symbol, :text]
                  required :type, const: :text

                  # @!method initialize(data:, media_type: :"text/plain", type: :text)
                  #   @param data [String]
                  #   @param media_type [Symbol, :"text/plain"]
                  #   @param type [Symbol, :text]
                end

                class ContentBlockSource < Sam::Internal::Type::BaseModel
                  # @!attribute content
                  #
                  #   @return [String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock>]
                  required :content,
                           union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content }

                  # @!attribute type
                  #
                  #   @return [Symbol, :content]
                  required :type, const: :content

                  # @!method initialize(content:, type: :content)
                  #   @param content [String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock>]
                  #   @param type [Symbol, :content]

                  # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource#content
                  module Content
                    extend Sam::Internal::Type::Union

                    variant String

                    variant -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1Array }

                    module UnionMember1
                      extend Sam::Internal::Type::Union

                      discriminator :type

                      variant :text,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock }

                      variant :image,
                              -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock }

                      class RequestTextBlock < Sam::Internal::Type::BaseModel
                        # @!attribute text
                        #
                        #   @return [String]
                        required :text, String

                        # @!attribute type
                        #
                        #   @return [Symbol, :text]
                        required :type, const: :text

                        # @!attribute cache_control
                        #
                        #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl, nil]
                        optional :cache_control,
                                 -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl },
                                 nil?: true

                        # @!attribute citations
                        #
                        #   @return [Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation>, nil]
                        optional :citations,
                                 -> do
                                   Sam::Internal::Type::ArrayOf[
                                     union: Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation
                                   ]
                                 end,
                                 nil?: true

                        # @!method initialize(text:, cache_control: nil, citations: nil, type: :text)
                        #   @param text [String]
                        #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl, nil]
                        #   @param citations [Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation>, nil]
                        #   @param type [Symbol, :text]

                        # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock#cache_control
                        class CacheControl < Sam::Internal::Type::BaseModel
                          # @!attribute type
                          #
                          #   @return [Symbol, :ephemeral]
                          required :type, const: :ephemeral

                          # @!method initialize(type: :ephemeral)
                          #   @param type [Symbol, :ephemeral]
                        end

                        module Citation
                          extend Sam::Internal::Type::Union

                          discriminator :type

                          variant :char_location,
                                  -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation }

                          variant :page_location,
                                  -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation }

                          variant :content_block_location,
                                  -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation }

                          class RequestCharLocationCitation < Sam::Internal::Type::BaseModel
                            # @!attribute cited_text
                            #
                            #   @return [String]
                            required :cited_text, String

                            # @!attribute document_index
                            #
                            #   @return [Integer]
                            required :document_index, Integer

                            # @!attribute document_title
                            #
                            #   @return [String, nil]
                            required :document_title, String, nil?: true

                            # @!attribute end_char_index
                            #
                            #   @return [Integer]
                            required :end_char_index, Integer

                            # @!attribute start_char_index
                            #
                            #   @return [Integer]
                            required :start_char_index, Integer

                            # @!attribute type
                            #
                            #   @return [Symbol, :char_location]
                            required :type, const: :char_location

                            # @!method initialize(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
                            #   @param cited_text [String]
                            #   @param document_index [Integer]
                            #   @param document_title [String, nil]
                            #   @param end_char_index [Integer]
                            #   @param start_char_index [Integer]
                            #   @param type [Symbol, :char_location]
                          end

                          class RequestPageLocationCitation < Sam::Internal::Type::BaseModel
                            # @!attribute cited_text
                            #
                            #   @return [String]
                            required :cited_text, String

                            # @!attribute document_index
                            #
                            #   @return [Integer]
                            required :document_index, Integer

                            # @!attribute document_title
                            #
                            #   @return [String, nil]
                            required :document_title, String, nil?: true

                            # @!attribute end_page_number
                            #
                            #   @return [Integer]
                            required :end_page_number, Integer

                            # @!attribute start_page_number
                            #
                            #   @return [Integer]
                            required :start_page_number, Integer

                            # @!attribute type
                            #
                            #   @return [Symbol, :page_location]
                            required :type, const: :page_location

                            # @!method initialize(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
                            #   @param cited_text [String]
                            #   @param document_index [Integer]
                            #   @param document_title [String, nil]
                            #   @param end_page_number [Integer]
                            #   @param start_page_number [Integer]
                            #   @param type [Symbol, :page_location]
                          end

                          class RequestContentBlockLocationCitation < Sam::Internal::Type::BaseModel
                            # @!attribute cited_text
                            #
                            #   @return [String]
                            required :cited_text, String

                            # @!attribute document_index
                            #
                            #   @return [Integer]
                            required :document_index, Integer

                            # @!attribute document_title
                            #
                            #   @return [String, nil]
                            required :document_title, String, nil?: true

                            # @!attribute end_block_index
                            #
                            #   @return [Integer]
                            required :end_block_index, Integer

                            # @!attribute start_block_index
                            #
                            #   @return [Integer]
                            required :start_block_index, Integer

                            # @!attribute type
                            #
                            #   @return [Symbol, :content_block_location]
                            required :type, const: :content_block_location

                            # @!method initialize(cited_text:, document_index:, document_title:, end_block_index:, start_block_index:, type: :content_block_location)
                            #   @param cited_text [String]
                            #   @param document_index [Integer]
                            #   @param document_title [String, nil]
                            #   @param end_block_index [Integer]
                            #   @param start_block_index [Integer]
                            #   @param type [Symbol, :content_block_location]
                          end

                          # @!method self.variants
                          #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation)]
                        end
                      end

                      class RequestImageBlock < Sam::Internal::Type::BaseModel
                        # @!attribute source
                        #
                        #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                        required :source,
                                 union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source }

                        # @!attribute type
                        #
                        #   @return [Symbol, :image]
                        required :type, const: :image

                        # @!attribute cache_control
                        #
                        #   @return [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl, nil]
                        optional :cache_control,
                                 -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl },
                                 nil?: true

                        # @!method initialize(source:, cache_control: nil, type: :image)
                        #   @param source [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]
                        #   @param cache_control [Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl, nil]
                        #   @param type [Symbol, :image]

                        # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock#source
                        module Source
                          extend Sam::Internal::Type::Union

                          discriminator :type

                          variant :base64,
                                  -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource }

                          variant :url,
                                  -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource }

                          class Base64ImageSource < Sam::Internal::Type::BaseModel
                            # @!attribute data
                            #
                            #   @return [String]
                            required :data, String

                            # @!attribute media_type
                            #
                            #   @return [Symbol, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType]
                            required :media_type,
                                     enum: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType }

                            # @!attribute type
                            #
                            #   @return [Symbol, :base64]
                            required :type, const: :base64

                            # @!method initialize(data:, media_type:, type: :base64)
                            #   @param data [String]
                            #   @param media_type [Symbol, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource::MediaType]
                            #   @param type [Symbol, :base64]

                            # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource#media_type
                            module MediaType
                              extend Sam::Internal::Type::Enum

                              IMAGE_JPEG = :"image/jpeg"
                              IMAGE_PNG = :"image/png"
                              IMAGE_GIF = :"image/gif"
                              IMAGE_WEBP = :"image/webp"

                              # @!method self.values
                              #   @return [Array<Symbol>]
                            end
                          end

                          class URLImageSource < Sam::Internal::Type::BaseModel
                            # @!attribute type
                            #
                            #   @return [Symbol, :url]
                            required :type, const: :url

                            # @!attribute url
                            #
                            #   @return [String]
                            required :url, String

                            # @!method initialize(url:, type: :url)
                            #   @param url [String]
                            #   @param type [Symbol, :url]
                          end

                          # @!method self.variants
                          #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource)]
                        end

                        # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock#cache_control
                        class CacheControl < Sam::Internal::Type::BaseModel
                          # @!attribute type
                          #
                          #   @return [Symbol, :ephemeral]
                          required :type, const: :ephemeral

                          # @!method initialize(type: :ephemeral)
                          #   @param type [Symbol, :ephemeral]
                        end
                      end

                      # @!method self.variants
                      #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock)]
                    end

                    # @!method self.variants
                    #   @return [Array(String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock>)]

                    UnionMember1Array =
                      Sam::Internal::Type::ArrayOf[
                        union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1 }
                      ]
                  end
                end

                class UrlpdfSource < Sam::Internal::Type::BaseModel
                  # @!attribute type
                  #
                  #   @return [Symbol, :url]
                  required :type, const: :url

                  # @!attribute url
                  #
                  #   @return [String]
                  required :url, String

                  # @!method initialize(url:, type: :url)
                  #   @param url [String]
                  #   @param type [Symbol, :url]
                end

                # @!method self.variants
                #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource)]
              end

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock#cache_control
              class CacheControl < Sam::Internal::Type::BaseModel
                # @!attribute type
                #
                #   @return [Symbol, :ephemeral]
                required :type, const: :ephemeral

                # @!method initialize(type: :ephemeral)
                #   @param type [Symbol, :ephemeral]
              end

              # @see Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock#citations
              class Citations < Sam::Internal::Type::BaseModel
                # @!attribute enabled
                #
                #   @return [Boolean, nil]
                optional :enabled, Sam::Internal::Type::Boolean

                # @!method initialize(enabled: nil)
                #   @param enabled [Boolean]
              end
            end

            class RequestThinkingBlock < Sam::Internal::Type::BaseModel
              # @!attribute signature
              #
              #   @return [String]
              required :signature, String

              # @!attribute thinking
              #
              #   @return [String]
              required :thinking, String

              # @!attribute type
              #
              #   @return [Symbol, :thinking]
              required :type, const: :thinking

              # @!method initialize(signature:, thinking:, type: :thinking)
              #   @param signature [String]
              #   @param thinking [String]
              #   @param type [Symbol, :thinking]
            end

            class RequestRedactedThinkingBlock < Sam::Internal::Type::BaseModel
              # @!attribute data
              #
              #   @return [String]
              required :data, String

              # @!attribute type
              #
              #   @return [Symbol, :redacted_thinking]
              required :type, const: :redacted_thinking

              # @!method initialize(data:, type: :redacted_thinking)
              #   @param data [String]
              #   @param type [Symbol, :redacted_thinking]
            end

            # @!method self.variants
            #   @return [Array(Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestThinkingBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock)]
          end

          # @!method self.variants
          #   @return [Array(String, Array<Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestTextBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestImageBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolUseBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestToolResultBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestDocumentBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestThinkingBlock, Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock>)]

          UnionMember1Array =
            Sam::Internal::Type::ArrayOf[union: -> { Sam::Models::MessageCountTokensParams::Message::Content::UnionMember1 }]
        end

        # @see Sam::Models::MessageCountTokensParams::Message#role
        module Role
          extend Sam::Internal::Type::Enum

          USER = :user
          ASSISTANT = :assistant

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # System prompt.
      #
      # A system prompt is a way of providing context and instructions to Claude, such
      # as specifying a particular goal or role. See our
      # [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
      module System
        extend Sam::Internal::Type::Union

        variant String

        variant -> { Sam::Models::MessageCountTokensParams::System::UnionMember1Array }

        class UnionMember1 < Sam::Internal::Type::BaseModel
          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, :text]
          required :type, const: :text

          # @!attribute cache_control
          #
          #   @return [Sam::Models::MessageCountTokensParams::System::UnionMember1::CacheControl, nil]
          optional :cache_control,
                   -> { Sam::Models::MessageCountTokensParams::System::UnionMember1::CacheControl },
                   nil?: true

          # @!attribute citations
          #
          #   @return [Array<Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation>, nil]
          optional :citations,
                   -> { Sam::Internal::Type::ArrayOf[union: Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation] },
                   nil?: true

          # @!method initialize(text:, cache_control: nil, citations: nil, type: :text)
          #   @param text [String]
          #   @param cache_control [Sam::Models::MessageCountTokensParams::System::UnionMember1::CacheControl, nil]
          #   @param citations [Array<Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation>, nil]
          #   @param type [Symbol, :text]

          # @see Sam::Models::MessageCountTokensParams::System::UnionMember1#cache_control
          class CacheControl < Sam::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :ephemeral]
            required :type, const: :ephemeral

            # @!method initialize(type: :ephemeral)
            #   @param type [Symbol, :ephemeral]
          end

          module Citation
            extend Sam::Internal::Type::Union

            discriminator :type

            variant :char_location,
                    -> { Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestCharLocationCitation }

            variant :page_location,
                    -> { Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestPageLocationCitation }

            variant :content_block_location,
                    -> { Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation }

            class RequestCharLocationCitation < Sam::Internal::Type::BaseModel
              # @!attribute cited_text
              #
              #   @return [String]
              required :cited_text, String

              # @!attribute document_index
              #
              #   @return [Integer]
              required :document_index, Integer

              # @!attribute document_title
              #
              #   @return [String, nil]
              required :document_title, String, nil?: true

              # @!attribute end_char_index
              #
              #   @return [Integer]
              required :end_char_index, Integer

              # @!attribute start_char_index
              #
              #   @return [Integer]
              required :start_char_index, Integer

              # @!attribute type
              #
              #   @return [Symbol, :char_location]
              required :type, const: :char_location

              # @!method initialize(cited_text:, document_index:, document_title:, end_char_index:, start_char_index:, type: :char_location)
              #   @param cited_text [String]
              #   @param document_index [Integer]
              #   @param document_title [String, nil]
              #   @param end_char_index [Integer]
              #   @param start_char_index [Integer]
              #   @param type [Symbol, :char_location]
            end

            class RequestPageLocationCitation < Sam::Internal::Type::BaseModel
              # @!attribute cited_text
              #
              #   @return [String]
              required :cited_text, String

              # @!attribute document_index
              #
              #   @return [Integer]
              required :document_index, Integer

              # @!attribute document_title
              #
              #   @return [String, nil]
              required :document_title, String, nil?: true

              # @!attribute end_page_number
              #
              #   @return [Integer]
              required :end_page_number, Integer

              # @!attribute start_page_number
              #
              #   @return [Integer]
              required :start_page_number, Integer

              # @!attribute type
              #
              #   @return [Symbol, :page_location]
              required :type, const: :page_location

              # @!method initialize(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type: :page_location)
              #   @param cited_text [String]
              #   @param document_index [Integer]
              #   @param document_title [String, nil]
              #   @param end_page_number [Integer]
              #   @param start_page_number [Integer]
              #   @param type [Symbol, :page_location]
            end

            class RequestContentBlockLocationCitation < Sam::Internal::Type::BaseModel
              # @!attribute cited_text
              #
              #   @return [String]
              required :cited_text, String

              # @!attribute document_index
              #
              #   @return [Integer]
              required :document_index, Integer

              # @!attribute document_title
              #
              #   @return [String, nil]
              required :document_title, String, nil?: true

              # @!attribute end_block_index
              #
              #   @return [Integer]
              required :end_block_index, Integer

              # @!attribute start_block_index
              #
              #   @return [Integer]
              required :start_block_index, Integer

              # @!attribute type
              #
              #   @return [Symbol, :content_block_location]
              required :type, const: :content_block_location

              # @!method initialize(cited_text:, document_index:, document_title:, end_block_index:, start_block_index:, type: :content_block_location)
              #   @param cited_text [String]
              #   @param document_index [Integer]
              #   @param document_title [String, nil]
              #   @param end_block_index [Integer]
              #   @param start_block_index [Integer]
              #   @param type [Symbol, :content_block_location]
            end

            # @!method self.variants
            #   @return [Array(Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestCharLocationCitation, Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestPageLocationCitation, Sam::Models::MessageCountTokensParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation)]
          end
        end

        # @!method self.variants
        #   @return [Array(String, Array<Sam::Models::MessageCountTokensParams::System::UnionMember1>)]

        UnionMember1Array =
          Sam::Internal::Type::ArrayOf[-> { Sam::Models::MessageCountTokensParams::System::UnionMember1 }]
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

        discriminator :type

        variant :enabled, -> { Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled }

        variant :disabled, -> { Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigDisabled }

        class ThinkingConfigEnabled < Sam::Internal::Type::BaseModel
          # @!attribute budget_tokens
          #   Determines how many tokens Claude can use for its internal reasoning process.
          #   Larger budgets can enable more thorough analysis for complex problems, improving
          #   response quality.
          #
          #   Must be ≥1024 and less than `max_tokens`.
          #
          #   See
          #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
          #   for details.
          #
          #   @return [Integer]
          required :budget_tokens, Integer

          # @!attribute type
          #
          #   @return [Symbol, :enabled]
          required :type, const: :enabled

          # @!method initialize(budget_tokens:, type: :enabled)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled} for
          #   more details.
          #
          #   @param budget_tokens [Integer] Determines how many tokens Claude can use for its internal reasoning process. La
          #   ...
          #
          #   @param type [Symbol, :enabled]
        end

        class ThinkingConfigDisabled < Sam::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :disabled]
          required :type, const: :disabled

          # @!method initialize(type: :disabled)
          #   @param type [Symbol, :disabled]
        end

        # @!method self.variants
        #   @return [Array(Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigEnabled, Sam::Models::MessageCountTokensParams::Thinking::ThinkingConfigDisabled)]
      end

      # How the model should use the provided tools. The model can use a specific tool,
      # any available tool, decide by itself, or not use tools at all.
      module ToolChoice
        extend Sam::Internal::Type::Union

        discriminator :type

        # The model will automatically decide whether to use tools.
        variant :auto, -> { Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto }

        # The model will use any available tools.
        variant :any, -> { Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny }

        # The model will use the specified tool with `tool_choice.name`.
        variant :tool, -> { Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool }

        # The model will not be allowed to use tools.
        variant :none, -> { Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceNone }

        class ToolChoiceAuto < Sam::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :auto]
          required :type, const: :auto

          # @!attribute disable_parallel_tool_use
          #   Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output at most one tool
          #   use.
          #
          #   @return [Boolean, nil]
          optional :disable_parallel_tool_use, Sam::Internal::Type::Boolean

          # @!method initialize(disable_parallel_tool_use: nil, type: :auto)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto} for more
          #   details.
          #
          #   The model will automatically decide whether to use tools.
          #
          #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use. ...
          #
          #   @param type [Symbol, :auto]
        end

        class ToolChoiceAny < Sam::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :any]
          required :type, const: :any

          # @!attribute disable_parallel_tool_use
          #   Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output exactly one tool
          #   use.
          #
          #   @return [Boolean, nil]
          optional :disable_parallel_tool_use, Sam::Internal::Type::Boolean

          # @!method initialize(disable_parallel_tool_use: nil, type: :any)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny} for more
          #   details.
          #
          #   The model will use any available tools.
          #
          #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use. ...
          #
          #   @param type [Symbol, :any]
        end

        class ToolChoiceTool < Sam::Internal::Type::BaseModel
          # @!attribute name
          #   The name of the tool to use.
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, :tool]
          required :type, const: :tool

          # @!attribute disable_parallel_tool_use
          #   Whether to disable parallel tool use.
          #
          #   Defaults to `false`. If set to `true`, the model will output exactly one tool
          #   use.
          #
          #   @return [Boolean, nil]
          optional :disable_parallel_tool_use, Sam::Internal::Type::Boolean

          # @!method initialize(name:, disable_parallel_tool_use: nil, type: :tool)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool} for more
          #   details.
          #
          #   The model will use the specified tool with `tool_choice.name`.
          #
          #   @param name [String] The name of the tool to use.
          #
          #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use. ...
          #
          #   @param type [Symbol, :tool]
        end

        class ToolChoiceNone < Sam::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :none]
          required :type, const: :none

          # @!method initialize(type: :none)
          #   The model will not be allowed to use tools.
          #
          #   @param type [Symbol, :none]
        end

        # @!method self.variants
        #   @return [Array(Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAuto, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceAny, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceTool, Sam::Models::MessageCountTokensParams::ToolChoice::ToolChoiceNone)]
      end

      module Tool
        extend Sam::Internal::Type::Union

        variant -> { Sam::Models::MessageCountTokensParams::Tool::Tool }

        variant -> { Sam::Models::MessageCountTokensParams::Tool::BashTool20250124 }

        variant -> { Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124 }

        class Tool < Sam::Internal::Type::BaseModel
          # @!attribute input_schema
          #   [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          #   This defines the shape of the `input` that your tool accepts and that the model
          #   will produce.
          #
          #   @return [Sam::Models::MessageCountTokensParams::Tool::Tool::InputSchema]
          required :input_schema, -> { Sam::Models::MessageCountTokensParams::Tool::Tool::InputSchema }

          # @!attribute name
          #   Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [String]
          required :name, String

          # @!attribute cache_control
          #
          #   @return [Sam::Models::MessageCountTokensParams::Tool::Tool::CacheControl, nil]
          optional :cache_control,
                   -> { Sam::Models::MessageCountTokensParams::Tool::Tool::CacheControl },
                   nil?: true

          # @!attribute description
          #   Description of what this tool does.
          #
          #   Tool descriptions should be as detailed as possible. The more information that
          #   the model has about what the tool is and how to use it, the better it will
          #   perform. You can use natural language descriptions to reinforce important
          #   aspects of the tool input JSON schema.
          #
          #   @return [String, nil]
          optional :description, String

          # @!method initialize(input_schema:, name:, cache_control: nil, description: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::Tool::Tool} for more details.
          #
          #   @param input_schema [Sam::Models::MessageCountTokensParams::Tool::Tool::InputSchema] [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input. ...
          #
          #   @param name [String] Name of the tool. ...
          #
          #   @param cache_control [Sam::Models::MessageCountTokensParams::Tool::Tool::CacheControl, nil]
          #
          #   @param description [String] Description of what this tool does. ...

          # @see Sam::Models::MessageCountTokensParams::Tool::Tool#input_schema
          class InputSchema < Sam::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :object]
            required :type, const: :object

            # @!attribute properties
            #
            #   @return [Object, nil]
            optional :properties, Sam::Internal::Type::Unknown, nil?: true

            # @!method initialize(properties: nil, type: :object)
            #   [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
            #
            #   This defines the shape of the `input` that your tool accepts and that the model
            #   will produce.
            #
            #   @param properties [Object, nil]
            #   @param type [Symbol, :object]
          end

          # @see Sam::Models::MessageCountTokensParams::Tool::Tool#cache_control
          class CacheControl < Sam::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :ephemeral]
            required :type, const: :ephemeral

            # @!method initialize(type: :ephemeral)
            #   @param type [Symbol, :ephemeral]
          end
        end

        class BashTool20250124 < Sam::Internal::Type::BaseModel
          # @!attribute name
          #   Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [Symbol, :bash]
          required :name, const: :bash

          # @!attribute type
          #
          #   @return [Symbol, :bash_20250124]
          required :type, const: :bash_20250124

          # @!attribute cache_control
          #
          #   @return [Sam::Models::MessageCountTokensParams::Tool::BashTool20250124::CacheControl, nil]
          optional :cache_control,
                   -> { Sam::Models::MessageCountTokensParams::Tool::BashTool20250124::CacheControl },
                   nil?: true

          # @!method initialize(cache_control: nil, name: :bash, type: :bash_20250124)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::Tool::BashTool20250124} for more
          #   details.
          #
          #   @param cache_control [Sam::Models::MessageCountTokensParams::Tool::BashTool20250124::CacheControl, nil]
          #
          #   @param name [Symbol, :bash] Name of the tool. ...
          #
          #   @param type [Symbol, :bash_20250124]

          # @see Sam::Models::MessageCountTokensParams::Tool::BashTool20250124#cache_control
          class CacheControl < Sam::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :ephemeral]
            required :type, const: :ephemeral

            # @!method initialize(type: :ephemeral)
            #   @param type [Symbol, :ephemeral]
          end
        end

        class TextEditor20250124 < Sam::Internal::Type::BaseModel
          # @!attribute name
          #   Name of the tool.
          #
          #   This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [Symbol, :str_replace_editor]
          required :name, const: :str_replace_editor

          # @!attribute type
          #
          #   @return [Symbol, :text_editor_20250124]
          required :type, const: :text_editor_20250124

          # @!attribute cache_control
          #
          #   @return [Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124::CacheControl, nil]
          optional :cache_control,
                   -> { Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124::CacheControl },
                   nil?: true

          # @!method initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20250124)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124} for more
          #   details.
          #
          #   @param cache_control [Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124::CacheControl, nil]
          #
          #   @param name [Symbol, :str_replace_editor] Name of the tool. ...
          #
          #   @param type [Symbol, :text_editor_20250124]

          # @see Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124#cache_control
          class CacheControl < Sam::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :ephemeral]
            required :type, const: :ephemeral

            # @!method initialize(type: :ephemeral)
            #   @param type [Symbol, :ephemeral]
          end
        end

        # @!method self.variants
        #   @return [Array(Sam::Models::MessageCountTokensParams::Tool::Tool, Sam::Models::MessageCountTokensParams::Tool::BashTool20250124, Sam::Models::MessageCountTokensParams::Tool::TextEditor20250124)]
      end
    end
  end
end
