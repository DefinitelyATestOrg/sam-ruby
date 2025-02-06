# typed: strong

module Sam
  module Models
    class UserLoginParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(T.nilable(String)) }
      attr_reader :password

      sig { params(password: String).void }
      attr_writer :password

      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      sig do
        params(
          password: String,
          username: String,
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        ).void
      end
      def initialize(password: nil, username: nil, request_options: {}); end

      sig { override.returns({password: String, username: String, request_options: Sam::RequestOptions}) }
      def to_hash; end
    end
  end
end
