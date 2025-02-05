# typed: strong

module Sam
  module Models
    class UserLoginParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      Shape = T.type_alias { T.all({password: String, username: String}, Sam::RequestParameters::Shape) }

      sig { returns(T.nilable(String)) }
      attr_reader :password

      sig { params(password: String).void }
      attr_writer :password

      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      sig { params(password: String, username: String, request_options: Sam::RequestOpts).void }
      def initialize(password: nil, username: nil, request_options: {}); end

      sig { returns(Sam::Models::UserLoginParams::Shape) }
      def to_h; end
    end
  end
end
