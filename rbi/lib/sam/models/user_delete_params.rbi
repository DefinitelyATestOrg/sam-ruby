# typed: strong

module Sam
  module Models
    class UserDeleteParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig do
        params(
          request_options: T.any(
            Sam::RequestOptions,
            T::Hash[Symbol, T.anything]
          )
        ).returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig { override.returns({request_options: Sam::RequestOptions}) }
      def to_hash
      end
    end
  end
end
