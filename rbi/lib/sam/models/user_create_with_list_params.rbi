# typed: strong

module Sam
  module Models
    class UserCreateWithListParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(T::Array[Sam::Models::User]) }
      attr_accessor :body

      sig do
        params(
          body: T::Array[Sam::Models::User],
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        ).void
      end
      def initialize(body:, request_options: {}); end

      sig { override.returns({body: T::Array[Sam::Models::User], request_options: Sam::RequestOptions}) }
      def to_hash; end
    end
  end
end
