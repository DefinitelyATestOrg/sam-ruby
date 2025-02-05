# typed: strong

module Sam
  module Models
    class UserCreateWithListParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      Shape = T.type_alias { T.all({body: T::Array[Sam::Models::User]}, Sam::RequestParameters::Shape) }

      sig { returns(T::Array[Sam::Models::User]) }
      attr_accessor :body

      sig { params(body: T::Array[Sam::Models::User], request_options: Sam::RequestOpts).void }
      def initialize(body:, request_options: {}); end

      sig { returns(Sam::Models::UserCreateWithListParams::Shape) }
      def to_h; end
    end
  end
end
