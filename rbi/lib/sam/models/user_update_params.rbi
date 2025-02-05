# typed: strong

module Sam
  module Models
    class UserUpdateParams < Sam::Models::User
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      Shape = T.type_alias { T.all({}, Sam::RequestParameters::Shape) }

      sig { params(request_options: Sam::RequestOpts).void }
      def initialize(request_options: {}); end

      sig { returns(Sam::Models::UserUpdateParams::Shape) }
      def to_h; end
    end
  end
end
