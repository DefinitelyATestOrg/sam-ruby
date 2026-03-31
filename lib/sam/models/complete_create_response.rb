# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::Complete#create
    class CompleteCreateResponse < Sam::Internal::Type::BaseModel
      # @!attribute id
      #   Unique object identifier.
      #
      #   The format and length of IDs may change over time.
      #
      #   @return [String]
      required :id, String

      # @!attribute completion
      #   The resulting completion up to and excluding the stop sequences.
      #
      #   @return [String]
      required :completion, String

      # @!attribute model
      #   The model that handled the request.
      #
      #   @return [String]
      required :model, String

      # @!attribute stop_reason
      #   The reason that we stopped.
      #
      #   This may be one the following values:
      #
      #   - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #     `stop_sequences` parameter, or a stop sequence built into the model
      #   - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      #
      #   @return [String, nil]
      required :stop_reason, String, nil?: true

      # @!attribute type
      #   Object type.
      #
      #   For Text Completions, this is always `"completion"`.
      #
      #   @return [Symbol, :completion]
      required :type, const: :completion

      # @!method initialize(id:, completion:, model:, stop_reason:, type: :completion)
      #   Some parameter documentations has been truncated, see
      #   {Sam::Models::CompleteCreateResponse} for more details.
      #
      #   @param id [String] Unique object identifier.
      #
      #   @param completion [String] The resulting completion up to and excluding the stop sequences.
      #
      #   @param model [String] The model that handled the request.
      #
      #   @param stop_reason [String, nil] The reason that we stopped.
      #
      #   @param type [Symbol, :completion] Object type.
    end
  end
end
