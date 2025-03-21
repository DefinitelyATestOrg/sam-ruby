# typed: strong

module Sam
  module Models
    module Messages
      class BatchResultsBetaResponse < Sam::BaseModel
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

        # Processing result for this request.
        #
        #   Contains a Message output if processing was successful, an error response if
        #   processing failed, or the reason why processing was not attempted, such as
        #   cancellation or expiration.
        sig do
          returns(
            T.any(
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult
            )
          )
        end
        def result
        end

        sig do
          params(
            _: T.any(
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult
            )
          )
            .returns(
              T.any(
                Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult,
                Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult,
                Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult,
                Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult
              )
            )
        end
        def result=(_)
        end

        # This is a single line in the response `.jsonl` file and does not represent the
        #   response as a whole.
        sig do
          params(
            custom_id: String,
            result: T.any(
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult,
              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult
            )
          )
            .returns(T.attached_class)
        end
        def self.new(custom_id:, result:)
        end

        sig do
          override
            .returns(
              {
                custom_id: String,
                result: T.any(
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult,
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult,
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult,
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult
                )
              }
            )
        end
        def to_hash
        end

        # Processing result for this request.
        #
        #   Contains a Message output if processing was successful, an error response if
        #   processing failed, or the reason why processing was not attempted, such as
        #   cancellation or expiration.
        module Result
          extend Sam::Union

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult,
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult,
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult,
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult
                )
              }
            end

          class BetaSucceededResult < Sam::BaseModel
            sig { returns(Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message) }
            def message
            end

            sig do
              params(
                _: T.any(
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message,
                  Sam::Util::AnyHash
                )
              )
                .returns(
                  T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message,
                    Sam::Util::AnyHash
                  )
                )
            end
            def message=(_)
            end

            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig do
              params(
                message: T.any(
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message,
                  Sam::Util::AnyHash
                ),
                type: Symbol
              )
                .returns(T.attached_class)
            end
            def self.new(message:, type: :succeeded)
            end

            sig do
              override
                .returns(
                  {message: Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message, type: Symbol}
                )
            end
            def to_hash
            end

            class Message < Sam::BaseModel
              # Unique object identifier.
              #
              #   The format and length of IDs may change over time.
              sig { returns(String) }
              def id
              end

              sig { params(_: String).returns(String) }
              def id=(_)
              end

              # Content generated by the model.
              #
              #   This is an array of content blocks, each of which has a `type` that determines
              #   its shape.
              #
              #   Example:
              #
              #   ```json
              #   [{ "type": "text", "text": "Hi, I'm Claude." }]
              #   ```
              #
              #   If the request input `messages` ended with an `assistant` turn, then the
              #   response `content` will continue directly from that last turn. You can use this
              #   to constrain the model's output.
              #
              #   For example, if the input `messages` were:
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
              #   Then the response `content` might be:
              #
              #   ```json
              #   [{ "type": "text", "text": "B)" }]
              #   ```
              sig do
                returns(
                  T::Array[
                  T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock
                  )
                  ]
                )
              end
              def content
              end

              sig do
                params(
                  _: T::Array[
                  T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock
                  )
                  ]
                )
                  .returns(
                    T::Array[
                    T.any(
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock
                    )
                    ]
                  )
              end
              def content=(_)
              end

              # The model that handled the request.
              sig { returns(String) }
              def model
              end

              sig { params(_: String).returns(String) }
              def model=(_)
              end

              # Conversational role of the generated message.
              #
              #   This will always be `"assistant"`.
              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              # The reason that we stopped.
              #
              #   This may be one the following values:
              #
              #   - `"end_turn"`: the model reached a natural stopping point
              #   - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
              #   - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
              #   - `"tool_use"`: the model invoked one or more tools
              #
              #   In non-streaming mode this value is always non-null. In streaming mode, it is
              #   null in the `message_start` event and non-null otherwise.
              sig do
                returns(
                  T.nilable(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  )
                )
              end
              def stop_reason
              end

              sig do
                params(
                  _: T.nilable(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  )
                )
                  .returns(
                    T.nilable(
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                    )
                  )
              end
              def stop_reason=(_)
              end

              # Which custom stop sequence was generated, if any.
              #
              #   This value will be a non-null string if one of your custom stop sequences was
              #   generated.
              sig { returns(T.nilable(String)) }
              def stop_sequence
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def stop_sequence=(_)
              end

              # Object type.
              #
              #   For Messages, this is always `"message"`.
              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              # Billing and rate-limit usage.
              #
              #   Anthropic's API bills and rate-limits by token counts, as tokens represent the
              #   underlying cost to our systems.
              #
              #   Under the hood, the API transforms requests into a format suitable for the
              #   model. The model's output then goes through a parsing stage before becoming an
              #   API response. As a result, the token counts in `usage` will not match one-to-one
              #   with the exact visible content of an API request or response.
              #
              #   For example, `output_tokens` will be non-zero, even for an empty string response
              #   from Claude.
              #
              #   Total input tokens in a request is the summation of `input_tokens`,
              #   `cache_creation_input_tokens`, and `cache_read_input_tokens`.
              sig { returns(Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Usage) }
              def usage
              end

              sig do
                params(
                  _: T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Usage,
                    Sam::Util::AnyHash
                  )
                )
                  .returns(
                    T.any(
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Usage,
                      Sam::Util::AnyHash
                    )
                  )
              end
              def usage=(_)
              end

              sig do
                params(
                  id: String,
                  content: T::Array[
                  T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock
                  )
                  ],
                  model: String,
                  stop_reason: T.nilable(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  ),
                  stop_sequence: T.nilable(String),
                  usage: T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Usage,
                    Sam::Util::AnyHash
                  ),
                  role: Symbol,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(id:, content:, model:, stop_reason:, stop_sequence:, usage:, role: :assistant, type: :message)
              end

              sig do
                override
                  .returns(
                    {
                      id: String,
                      content: T::Array[
                      T.any(
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock
                      )
                      ],
                      model: String,
                      role: Symbol,
                      stop_reason: T.nilable(
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                      ),
                      stop_sequence: T.nilable(String),
                      type: Symbol,
                      usage: Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Usage
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
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock
                      )
                    }
                  end

                class BetaResponseTextBlock < Sam::BaseModel
                  # Citations supporting the text block.
                  #
                  #   The type of citation returned will depend on the type of document being cited.
                  #   Citing a PDF results in `page_location`, plain text results in `char_location`,
                  #   and content document results in `content_block_location`.
                  sig do
                    returns(
                      T.nilable(
                        T::Array[
                        T.any(
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation,
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation,
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation
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
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation,
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation,
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation
                        )
                        ]
                      )
                    )
                      .returns(
                        T.nilable(
                          T::Array[
                          T.any(
                            Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation,
                            Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation,
                            Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation
                          )
                          ]
                        )
                      )
                  end
                  def citations=(_)
                  end

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
                    params(
                      citations: T.nilable(
                        T::Array[
                        T.any(
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation,
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation,
                          Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation
                        )
                        ]
                      ),
                      text: String,
                      type: Symbol
                    )
                      .returns(T.attached_class)
                  end
                  def self.new(citations:, text:, type: :text)
                  end

                  sig do
                    override
                      .returns(
                        {
                          citations: T.nilable(
                            T::Array[
                            T.any(
                              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation,
                              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation,
                              Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation
                            )
                            ]
                          ),
                          text: String,
                          type: Symbol
                        }
                      )
                  end
                  def to_hash
                  end

                  module Citation
                    extend Sam::Union

                    Variants =
                      type_template(:out) do
                        {
                          fixed: T.any(
                            Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation,
                            Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation,
                            Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation
                          )
                        }
                      end

                    class BetaResponseCharLocationCitation < Sam::BaseModel
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

                    class BetaResponsePageLocationCitation < Sam::BaseModel
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

                    class BetaResponseContentBlockLocationCitation < Sam::BaseModel
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
                            [Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseCharLocationCitation, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponsePageLocationCitation, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock::Citation::BetaResponseContentBlockLocationCitation]
                          )
                      end
                      def variants
                      end
                    end
                  end
                end

                class BetaResponseToolUseBlock < Sam::BaseModel
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
                    params(
                      id: String,
                      input: T.anything,
                      name: String,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(id:, input:, name:, type: :tool_use)
                  end

                  sig { override.returns({id: String, input: T.anything, name: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaResponseThinkingBlock < Sam::BaseModel
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

                class BetaResponseRedactedThinkingBlock < Sam::BaseModel
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
                        [Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseTextBlock, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseToolUseBlock, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseThinkingBlock, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::Content::BetaResponseRedactedThinkingBlock]
                      )
                  end
                  def variants
                  end
                end
              end

              # The reason that we stopped.
              #
              #   This may be one the following values:
              #
              #   - `"end_turn"`: the model reached a natural stopping point
              #   - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
              #   - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
              #   - `"tool_use"`: the model invoked one or more tools
              #
              #   In non-streaming mode this value is always non-null. In streaming mode, it is
              #   null in the `message_start` event and non-null otherwise.
              module StopReason
                extend Sam::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(Symbol, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason)
                  end
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                    )
                  end

                END_TURN =
                  T.let(
                    :end_turn,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  )
                MAX_TOKENS =
                  T.let(
                    :max_tokens,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  )
                STOP_SEQUENCE =
                  T.let(
                    :stop_sequence,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  )
                TOOL_USE =
                  T.let(
                    :tool_use,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                  )

                class << self
                  sig do
                    override
                      .returns(
                        T::Array[
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult::Message::StopReason::TaggedSymbol
                        ]
                      )
                  end
                  def values
                  end
                end
              end

              class Usage < Sam::BaseModel
                # The number of input tokens used to create the cache entry.
                sig { returns(T.nilable(Integer)) }
                def cache_creation_input_tokens
                end

                sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
                def cache_creation_input_tokens=(_)
                end

                # The number of input tokens read from the cache.
                sig { returns(T.nilable(Integer)) }
                def cache_read_input_tokens
                end

                sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
                def cache_read_input_tokens=(_)
                end

                # The number of input tokens which were used.
                sig { returns(Integer) }
                def input_tokens
                end

                sig { params(_: Integer).returns(Integer) }
                def input_tokens=(_)
                end

                # The number of output tokens which were used.
                sig { returns(Integer) }
                def output_tokens
                end

                sig { params(_: Integer).returns(Integer) }
                def output_tokens=(_)
                end

                # Billing and rate-limit usage.
                #
                #   Anthropic's API bills and rate-limits by token counts, as tokens represent the
                #   underlying cost to our systems.
                #
                #   Under the hood, the API transforms requests into a format suitable for the
                #   model. The model's output then goes through a parsing stage before becoming an
                #   API response. As a result, the token counts in `usage` will not match one-to-one
                #   with the exact visible content of an API request or response.
                #
                #   For example, `output_tokens` will be non-zero, even for an empty string response
                #   from Claude.
                #
                #   Total input tokens in a request is the summation of `input_tokens`,
                #   `cache_creation_input_tokens`, and `cache_read_input_tokens`.
                sig do
                  params(
                    cache_creation_input_tokens: T.nilable(Integer),
                    cache_read_input_tokens: T.nilable(Integer),
                    input_tokens: Integer,
                    output_tokens: Integer
                  )
                    .returns(T.attached_class)
                end
                def self.new(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:)
                end

                sig do
                  override
                    .returns(
                      {
                        cache_creation_input_tokens: T.nilable(Integer),
                        cache_read_input_tokens: T.nilable(Integer),
                        input_tokens: Integer,
                        output_tokens: Integer
                      }
                    )
                end
                def to_hash
                end
              end
            end
          end

          class BetaErroredResult < Sam::BaseModel
            sig { returns(Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error) }
            def error
            end

            sig do
              params(
                _: T.any(
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error,
                  Sam::Util::AnyHash
                )
              )
                .returns(
                  T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error,
                    Sam::Util::AnyHash
                  )
                )
            end
            def error=(_)
            end

            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig do
              params(
                error: T.any(
                  Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error,
                  Sam::Util::AnyHash
                ),
                type: Symbol
              )
                .returns(T.attached_class)
            end
            def self.new(error:, type: :errored)
            end

            sig do
              override
                .returns(
                  {error: Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error, type: Symbol}
                )
            end
            def to_hash
            end

            class Error < Sam::BaseModel
              sig do
                returns(
                  T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError
                  )
                )
              end
              def error
              end

              sig do
                params(
                  _: T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError
                  )
                )
                  .returns(
                    T.any(
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError,
                      Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError
                    )
                  )
              end
              def error=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  error: T.any(
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError,
                    Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError
                  ),
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(error:, type: :error)
              end

              sig do
                override
                  .returns(
                    {
                      error: T.any(
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError
                      ),
                      type: Symbol
                    }
                  )
              end
              def to_hash
              end

              module Error
                extend Sam::Union

                Variants =
                  type_template(:out) do
                    {
                      fixed: T.any(
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError,
                        Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError
                      )
                    }
                  end

                class BetaInvalidRequestError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :invalid_request_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaAuthenticationError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :authentication_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaBillingError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :billing_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaPermissionError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :permission_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaNotFoundError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :not_found_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaRateLimitError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :rate_limit_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaGatewayTimeoutError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :timeout_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaAPIError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :api_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class BetaOverloadedError < Sam::BaseModel
                  sig { returns(String) }
                  def message
                  end

                  sig { params(_: String).returns(String) }
                  def message=(_)
                  end

                  sig { returns(Symbol) }
                  def type
                  end

                  sig { params(_: Symbol).returns(Symbol) }
                  def type=(_)
                  end

                  sig { params(message: String, type: Symbol).returns(T.attached_class) }
                  def self.new(message:, type: :overloaded_error)
                  end

                  sig { override.returns({message: String, type: Symbol}) }
                  def to_hash
                  end
                end

                class << self
                  sig do
                    override
                      .returns(
                        [Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaInvalidRequestError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAuthenticationError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaBillingError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaPermissionError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaNotFoundError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaRateLimitError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaGatewayTimeoutError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaAPIError, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult::Error::Error::BetaOverloadedError]
                      )
                  end
                  def variants
                  end
                end
              end
            end
          end

          class BetaCanceledResult < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :canceled)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end

          class BetaExpiredResult < Sam::BaseModel
            sig { returns(Symbol) }
            def type
            end

            sig { params(_: Symbol).returns(Symbol) }
            def type=(_)
            end

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :expired)
            end

            sig { override.returns({type: Symbol}) }
            def to_hash
            end
          end

          class << self
            sig do
              override
                .returns(
                  [Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaSucceededResult, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaErroredResult, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaCanceledResult, Sam::Models::Messages::BatchResultsBetaResponse::Result::BetaExpiredResult]
                )
            end
            def variants
            end
          end
        end
      end
    end
  end
end
