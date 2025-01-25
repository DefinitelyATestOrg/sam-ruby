# frozen_string_literal: true

module Sam
  module Models
    module Store
      class OrderDeleteParams < Sam::BaseModel
        # @!parse
        #   extend Sam::RequestParameters::Converter
        include Sam::RequestParameters

        # @!parse
        #   # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(request_options: {}, **) = super

        # def initialize: (Hash | Sam::BaseModel) -> void
      end
    end
  end
end
