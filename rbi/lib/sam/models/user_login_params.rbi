# typed: strong

module Sam
  module Models
    class UserLoginParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(T.nilable(String)) }
      def password
      end

      sig { params(_: String).returns(String) }
      def password=(_)
      end

      sig { returns(T.nilable(String)) }
      def username
      end

      sig { params(_: String).returns(String) }
      def username=(_)
      end

      sig do
        params(
          password: String,
          username: String,
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        ).void
      end
      def initialize(password: nil, username: nil, request_options: {})
      end

      sig { override.returns({password: String, username: String, request_options: Sam::RequestOptions}) }
      def to_hash
      end
    end
  end
end
