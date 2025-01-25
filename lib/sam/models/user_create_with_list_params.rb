# frozen_string_literal: true

module Sam
  module Models
    class UserCreateWithListParams < Sam::BaseModel
      # @!parse
      #   extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # @!attribute body
      #
      #   @return [Array<Sam::Models::User>]
      required :body, -> { Sam::ArrayOf[Sam::Models::User] }

      # @!parse
      #   # @param body [Array<Sam::Models::User>]
      #   # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(body:, request_options: {}, **) = super

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
