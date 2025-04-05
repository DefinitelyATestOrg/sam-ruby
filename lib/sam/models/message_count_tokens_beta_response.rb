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

      # @!parse
      #   # @param input_tokens [Integer]
      #   #
      #   def initialize(input_tokens:, **) = super

      # def initialize: (Hash | Sam::Internal::Type::BaseModel) -> void
    end
  end
end
