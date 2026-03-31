# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::Messages#count_tokens
    class MessageCountTokensResponse < Sam::Internal::Type::BaseModel
      # @!attribute input_tokens
      #   The total number of tokens across the provided list of messages, system prompt,
      #   and tools.
      #
      #   @return [Integer]
      required :input_tokens, Integer

      # @!method initialize(input_tokens:)
      #   Some parameter documentations has been truncated, see
      #   {Sam::Models::MessageCountTokensResponse} for more details.
      #
      #   @param input_tokens [Integer] The total number of tokens across the provided list of messages, system prompt,
    end
  end
end
