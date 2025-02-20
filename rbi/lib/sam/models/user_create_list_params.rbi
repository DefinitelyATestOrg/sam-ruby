# typed: strong

module Sam
  module Models
    class UserCreateListParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(T.nilable(T::Array[Sam::Models::UserAPI])) }
      def body
      end

      sig { params(_: T::Array[Sam::Models::UserAPI]).returns(T::Array[Sam::Models::UserAPI]) }
      def body=(_)
      end

      sig do
        params(
          body: T::Array[Sam::Models::UserAPI],
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(body: nil, request_options: {})
      end

      sig { override.returns({body: T::Array[Sam::Models::UserAPI], request_options: Sam::RequestOptions}) }
      def to_hash
      end
    end
  end
end
