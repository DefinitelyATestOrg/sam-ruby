# frozen_string_literal: true

module Sam
  module Models
    class UserCreateListParams < Sam::BaseModel
      # @!parse
      #   extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # @!attribute [r] body
      #
      #   @return [Array<Sam::Models::UserAPI>, nil]
      optional :body, -> { Sam::ArrayOf[Sam::Models::UserAPI] }

      # @!parse
      #   # @return [Array<Sam::Models::UserAPI>]
      #   attr_writer :body

      # @!parse
      #   # @param body [Array<Sam::Models::UserAPI>]
      #   # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(body: nil, request_options: {}, **) = super

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
