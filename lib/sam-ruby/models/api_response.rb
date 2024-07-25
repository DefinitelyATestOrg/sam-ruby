# frozen_string_literal: true

module SamRuby
  module Models
    class APIResponse < BaseModel
      # @!attribute [rw] code
      #   @return [Integer]
      optional :code, Integer

      # @!attribute [rw] message
      #   @return [String]
      optional :message, String

      # @!attribute [rw] type
      #   @return [String]
      optional :type, String
    end
  end
end
