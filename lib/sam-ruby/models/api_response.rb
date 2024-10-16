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

      # Create a new instance of APIResponse from a Hash of raw data.
      #
      # @overload initialize(code: nil, message: nil, type: nil)
      # @param code [Integer]
      # @param message [String]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
