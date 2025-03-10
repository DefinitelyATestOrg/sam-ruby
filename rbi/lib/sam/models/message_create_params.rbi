# typed: strong

module Sam
  module Models
    class MessageCreateParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(Integer) }
      def max_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def max_tokens=(_)
      end

      sig { returns(T::Array[Sam::Models::MessageCreateParams::Message]) }
      def messages
      end

      sig do
        params(_: T::Array[Sam::Models::MessageCreateParams::Message])
          .returns(T::Array[Sam::Models::MessageCreateParams::Message])
      end
      def messages=(_)
      end

      sig { returns(String) }
      def model
      end

      sig { params(_: String).returns(String) }
      def model=(_)
      end

      sig { returns(T.nilable(Sam::Models::MessageCreateParams::Metadata)) }
      def metadata
      end

      sig { params(_: Sam::Models::MessageCreateParams::Metadata).returns(Sam::Models::MessageCreateParams::Metadata) }
      def metadata=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def stop_sequences
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def stop_sequences=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]))) }
      def system_
      end

      sig do
        params(_: T.any(String, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]))
          .returns(T.any(String, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]))
      end
      def system_=(_)
      end

      sig { returns(T.nilable(Float)) }
      def temperature
      end

      sig { params(_: Float).returns(Float) }
      def temperature=(_)
      end

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
      def thinking
      end

      sig do
        params(
          _: T.any(
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled,
            Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled
          )
        )
          .returns(
            T.any(
              Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled,
              Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled
            )
          )
      end
      def thinking=(_)
      end

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
      def tool_choice
      end

      sig do
        params(
          _: T.any(
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool,
            Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone
          )
        )
          .returns(
            T.any(
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto,
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny,
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool,
              Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone
            )
          )
      end
      def tool_choice=(_)
      end

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
      def tools
      end

      sig do
        params(
          _: T::Array[
          T.any(
            Sam::Models::MessageCreateParams::Tool::Tool,
            Sam::Models::MessageCreateParams::Tool::BashTool20250124,
            Sam::Models::MessageCreateParams::Tool::TextEditor20250124
          )
          ]
        )
          .returns(
            T::Array[
            T.any(
              Sam::Models::MessageCreateParams::Tool::Tool,
              Sam::Models::MessageCreateParams::Tool::BashTool20250124,
              Sam::Models::MessageCreateParams::Tool::TextEditor20250124
            )
            ]
          )
      end
      def tools=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def top_k
      end

      sig { params(_: Integer).returns(Integer) }
      def top_k=(_)
      end

      sig { returns(T.nilable(Float)) }
      def top_p
      end

      sig { params(_: Float).returns(Float) }
      def top_p=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def anthropic_beta
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def anthropic_beta=(_)
      end

      sig { returns(T.nilable(String)) }
      def anthropic_version
      end

      sig { params(_: String).returns(String) }
      def anthropic_version=(_)
      end

      sig { returns(T.nilable(String)) }
      def x_api_key
      end

      sig { params(_: String).returns(String) }
      def x_api_key=(_)
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
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
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
        def content
        end

        sig do
          params(
            _: T.any(
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
            .returns(
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
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock,
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock,
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock,
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock,
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock,
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock,
              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock
            )
            ]
          end

          class UnionMember1 < Sam::Union
            abstract!

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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::CacheControl
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
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                    )
                    ]
                  )
                )
                  .returns(
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
              def citations=(_)
              end

              sig do
                params(
                  text: String,
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

                class << self
                  sig do
                    override
                      .returns(
                        [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation]]
                      )
                  end
                  private def variants
                  end
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
              def source
              end

              sig do
                params(
                  _: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                  )
                )
                  .returns(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                params(
                  source: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                  ),
                  cache_control: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::CacheControl
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

              class Source < Sam::Union
                abstract!

                class Base64ImageSource < Sam::BaseModel
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

                class << self
                  sig do
                    override
                      .returns(
                        [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]]
                      )
                  end
                  private def variants
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock::CacheControl
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::CacheControl
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
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
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
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                    )
                    ]
                  )
                )
                  .returns(
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                  )
                  ]
                end

                class UnionMember1 < Sam::Union
                  abstract!

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
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::CacheControl
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
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                          )
                          ]
                        )
                      )
                        .returns(
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
                    def citations=(_)
                    end

                    sig do
                      params(
                        text: String,
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

                      class << self
                        sig do
                          override
                            .returns(
                              [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation]]
                            )
                        end
                        private def variants
                        end
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
                    def source
                    end

                    sig do
                      params(
                        _: T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        )
                      )
                        .returns(
                          T.any(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
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
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                        )
                      )
                    end
                    def cache_control
                    end

                    sig do
                      params(
                        _: T.nilable(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                        )
                      )
                        .returns(
                          T.nilable(
                            Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
                          )
                        )
                    end
                    def cache_control=(_)
                    end

                    sig do
                      params(
                        source: T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                        ),
                        cache_control: T.nilable(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::CacheControl
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

                    class Source < Sam::Union
                      abstract!

                      class Base64ImageSource < Sam::BaseModel
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

                      class << self
                        sig do
                          override
                            .returns(
                              [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]]
                            )
                        end
                        private def variants
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
                          [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock]]
                        )
                    end
                    private def variants
                    end
                  end
                end

                class << self
                  sig do
                    override
                      .returns(
                        [
                          [NilClass, String],
                          [
                            NilClass,
                            T::Array[
                                                    T.any(
                                                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestTextBlock,
                                                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock::Content::UnionMember1::RequestImageBlock
                                                    )
                                                    ]
                          ]
                        ]
                      )
                  end
                  private def variants
                  end
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
              def source
              end

              sig do
                params(
                  _: T.any(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                  )
                )
                  .returns(
                    T.any(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                  )
                )
              end
              def cache_control
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                    )
                  )
              end
              def cache_control=(_)
              end

              sig do
                returns(
                  T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations
                  )
                )
              end
              def citations
              end

              sig do
                params(
                  _: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations
                )
                  .returns(Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations)
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
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource,
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource
                  ),
                  cache_control: T.nilable(
                    Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::CacheControl
                  ),
                  citations: Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Citations,
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

              class Source < Sam::Union
                abstract!

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

                  sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
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
                  def content
                  end

                  sig do
                    params(
                      _: T.any(
                        String,
                        T::Array[
                        T.any(
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                        )
                        ]
                      )
                    )
                      .returns(
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
                          Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
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

                  class Content < Sam::Union
                    abstract!

                    UnionMember1Array = T.type_alias do
                      T::Array[
                      T.any(
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                        Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                      )
                      ]
                    end

                    class UnionMember1 < Sam::Union
                      abstract!

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
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                            )
                          )
                        end
                        def cache_control
                        end

                        sig do
                          params(
                            _: T.nilable(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
                            )
                          )
                            .returns(
                              T.nilable(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::CacheControl
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
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
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
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation
                              )
                              ]
                            )
                          )
                            .returns(
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
                        def citations=(_)
                        end

                        sig do
                          params(
                            text: String,
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

                          class << self
                            sig do
                              override
                                .returns(
                                  [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestCharLocationCitation], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestPageLocationCitation], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock::Citation::RequestContentBlockLocationCitation]]
                                )
                            end
                            private def variants
                            end
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
                        def source
                        end

                        sig do
                          params(
                            _: T.any(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            )
                          )
                            .returns(
                              T.any(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
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
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                            )
                          )
                        end
                        def cache_control
                        end

                        sig do
                          params(
                            _: T.nilable(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                            )
                          )
                            .returns(
                              T.nilable(
                                Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
                              )
                            )
                        end
                        def cache_control=(_)
                        end

                        sig do
                          params(
                            source: T.any(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource,
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource
                            ),
                            cache_control: T.nilable(
                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::CacheControl
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

                        class Source < Sam::Union
                          abstract!

                          class Base64ImageSource < Sam::BaseModel
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

                          class << self
                            sig do
                              override
                                .returns(
                                  [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::Base64ImageSource], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock::Source::URLImageSource]]
                                )
                            end
                            private def variants
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
                              [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock]]
                            )
                        end
                        private def variants
                        end
                      end
                    end

                    class << self
                      sig do
                        override
                          .returns(
                            [
                              [NilClass, String],
                              [
                                NilClass,
                                T::Array[
                                                            T.any(
                                                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestTextBlock,
                                                              Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource::Content::UnionMember1::RequestImageBlock
                                                            )
                                                            ]
                              ]
                            ]
                          )
                      end
                      private def variants
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

                class << self
                  sig do
                    override
                      .returns(
                        [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::Base64PdfSource], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::PlainTextSource], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::ContentBlockSource], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock::Source::UrlpdfSource]]
                      )
                  end
                  private def variants
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

              sig { params(signature: String, thinking: String, type: Symbol).returns(T.attached_class) }
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

            class << self
              sig do
                override
                  .returns(
                    [[Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestTextBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestImageBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolUseBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestToolResultBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestDocumentBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestThinkingBlock], [Symbol, Sam::Models::MessageCreateParams::Message::Content::UnionMember1::RequestRedactedThinkingBlock]]
                  )
              end
              private def variants
              end
            end
          end

          class << self
            sig do
              override
                .returns(
                  [
                    [NilClass, String],
                    [
                      NilClass,
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
                  ]
                )
            end
            private def variants
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

      class Metadata < Sam::BaseModel
        sig { returns(T.nilable(String)) }
        def user_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def user_id=(_)
        end

        sig { params(user_id: T.nilable(String)).returns(T.attached_class) }
        def self.new(user_id: nil)
        end

        sig { override.returns({user_id: T.nilable(String)}) }
        def to_hash
        end
      end

      class System < Sam::Union
        abstract!

        UnionMember1Array = T.type_alias { T::Array[Sam::Models::MessageCreateParams::System::UnionMember1] }

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

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl))
          end
          def cache_control=(_)
          end

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
          def citations
          end

          sig do
            params(
              _: T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation,
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestPageLocationCitation,
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation
                )
                ]
              )
            )
              .returns(
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
          def citations=(_)
          end

          sig do
            params(
              text: String,
              cache_control: T.nilable(Sam::Models::MessageCreateParams::System::UnionMember1::CacheControl),
              citations: T.nilable(
                T::Array[
                T.any(
                  Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation,
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

            class << self
              sig do
                override
                  .returns(
                    [[Symbol, Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestCharLocationCitation], [Symbol, Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestPageLocationCitation], [Symbol, Sam::Models::MessageCreateParams::System::UnionMember1::Citation::RequestContentBlockLocationCitation]]
                  )
              end
              private def variants
              end
            end
          end
        end

        class << self
          sig do
            override
              .returns(
                [[NilClass, String], [NilClass, T::Array[Sam::Models::MessageCreateParams::System::UnionMember1]]]
              )
          end
          private def variants
          end
        end
      end

      class Thinking < Sam::Union
        abstract!

        class ThinkingConfigEnabled < Sam::BaseModel
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

        class << self
          sig do
            override
              .returns(
                [[Symbol, Sam::Models::MessageCreateParams::Thinking::ThinkingConfigEnabled], [Symbol, Sam::Models::MessageCreateParams::Thinking::ThinkingConfigDisabled]]
              )
          end
          private def variants
          end
        end
      end

      class ToolChoice < Sam::Union
        abstract!

        class ToolChoiceAuto < Sam::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(T::Boolean)) }
          def disable_parallel_tool_use
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def disable_parallel_tool_use=(_)
          end

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

          sig { returns(T.nilable(T::Boolean)) }
          def disable_parallel_tool_use
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def disable_parallel_tool_use=(_)
          end

          sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(T.attached_class) }
          def self.new(disable_parallel_tool_use: nil, type: :any)
          end

          sig { override.returns({type: Symbol, disable_parallel_tool_use: T::Boolean}) }
          def to_hash
          end
        end

        class ToolChoiceTool < Sam::BaseModel
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

          sig { returns(T.nilable(T::Boolean)) }
          def disable_parallel_tool_use
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def disable_parallel_tool_use=(_)
          end

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
                [[Symbol, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAuto], [Symbol, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceAny], [Symbol, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceTool], [Symbol, Sam::Models::MessageCreateParams::ToolChoice::ToolChoiceNone]]
              )
          end
          private def variants
          end
        end
      end

      class Tool < Sam::Union
        abstract!

        class Tool < Sam::BaseModel
          sig { returns(Sam::Models::MessageCreateParams::Tool::Tool::InputSchema) }
          def input_schema
          end

          sig do
            params(_: Sam::Models::MessageCreateParams::Tool::Tool::InputSchema)
              .returns(Sam::Models::MessageCreateParams::Tool::Tool::InputSchema)
          end
          def input_schema=(_)
          end

          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl))
          end
          def cache_control=(_)
          end

          sig { returns(T.nilable(String)) }
          def description
          end

          sig { params(_: String).returns(String) }
          def description=(_)
          end

          sig do
            params(
              input_schema: Sam::Models::MessageCreateParams::Tool::Tool::InputSchema,
              name: String,
              cache_control: T.nilable(Sam::Models::MessageCreateParams::Tool::Tool::CacheControl),
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

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            params(
              cache_control: T.nilable(Sam::Models::MessageCreateParams::Tool::BashTool20250124::CacheControl),
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

          sig { returns(T.nilable(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl)) }
          def cache_control
          end

          sig do
            params(_: T.nilable(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl))
              .returns(T.nilable(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl))
          end
          def cache_control=(_)
          end

          sig do
            params(
              cache_control: T.nilable(Sam::Models::MessageCreateParams::Tool::TextEditor20250124::CacheControl),
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
                [[NilClass, Sam::Models::MessageCreateParams::Tool::Tool], [NilClass, Sam::Models::MessageCreateParams::Tool::BashTool20250124], [NilClass, Sam::Models::MessageCreateParams::Tool::TextEditor20250124]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
