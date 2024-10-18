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

      # @!parse
      #   # Create a new instance of APIResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer, nil] :code
      #   #   @option data [String, nil] :message
      #   #   @option data [String, nil] :type
      #   def initialize(data = {}) = super
    end
  end
end
