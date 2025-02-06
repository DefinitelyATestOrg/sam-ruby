# typed: strong

module Sam
  module Models
    class UserUpdateParams < Sam::Models::User
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { params(request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])).void }
      def initialize(request_options: {}); end

      sig { override.returns({request_options: Sam::RequestOptions}) }
      def to_hash; end
    end
  end
end
