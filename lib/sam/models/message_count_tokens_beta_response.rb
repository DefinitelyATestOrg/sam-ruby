# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::Messages#count_tokens_beta
    class MessageCountTokensBetaResponse < Sam::Internal::Type::BaseModel
      # @!attribute input_tokens
      #   The total number of tokens across the provided list of messages, system prompt,
      #   and tools.
      #
      #   @return [Integer]
      required :input_tokens, Integer

      # @!method initialize(input_tokens:)
      #   @param input_tokens [Integer]
    end
  end
end
