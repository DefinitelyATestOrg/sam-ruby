# typed: strong

module Sam
  module Models
    module Store
      class OrderDeleteParams < Sam::BaseModel
        extend Sam::RequestParameters::Converter
        include Sam::RequestParameters

        Shape = T.type_alias { T.all({}, Sam::RequestParameters::Shape) }

        sig { params(request_options: Sam::RequestOpts).void }
        def initialize(request_options: {}); end

        sig { returns(Sam::Models::Store::OrderDeleteParams::Shape) }
        def to_h; end
      end
    end
  end
end
