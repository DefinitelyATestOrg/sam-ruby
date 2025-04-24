# typed: strong

module Sam
  module Models
    class CompleteCreateResponse < Sam::Internal::Type::BaseModel
      # Unique object identifier.
      #
      # The format and length of IDs may change over time.
      sig { returns(String) }
      attr_accessor :id

      # The resulting completion up to and excluding the stop sequences.
      sig { returns(String) }
      attr_accessor :completion

      # The model that handled the request.
      sig { returns(String) }
      attr_accessor :model

      # The reason that we stopped.
      #
      # This may be one the following values:
      #
      # - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #   `stop_sequences` parameter, or a stop sequence built into the model
      # - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      sig { returns(T.nilable(String)) }
      attr_accessor :stop_reason

      # Object type.
      #
      # For Text Completions, this is always `"completion"`.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(id: String, completion: String, model: String, stop_reason: T.nilable(String), type: Symbol)
          .returns(T.attached_class)
      end
      def self.new(
        # Unique object identifier.
        #
        # The format and length of IDs may change over time.
        id:,
        # The resulting completion up to and excluding the stop sequences.
        completion:,
        # The model that handled the request.
        model:,
        # The reason that we stopped.
        #
        # This may be one the following values:
        #
        # - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
        #   `stop_sequences` parameter, or a stop sequence built into the model
        # - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
        stop_reason:,
        # Object type.
        #
        # For Text Completions, this is always `"completion"`.
        type: :completion
      ); end
      sig do
        override
          .returns({
                     id: String,
                     completion: String,
                     model: String,
                     stop_reason: T.nilable(String),
                     type: Symbol
                   })
      end
      def to_hash; end
    end
  end
end
