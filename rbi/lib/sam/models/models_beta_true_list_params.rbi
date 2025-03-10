# typed: strong

module Sam
  module Models
    class ModelsBetaTrueListParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      sig { returns(T.nilable(String)) }
      def after_id
      end

      sig { params(_: String).returns(String) }
      def after_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def before_id
      end

      sig { params(_: String).returns(String) }
      def before_id=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: Integer).returns(Integer) }
      def limit=(_)
      end

      sig { returns(T.nilable(String)) }
      def anthropic_version
      end

      sig { params(_: String).returns(String) }
      def anthropic_version=(_)
      end

      sig { returns(T.nilable(String)) }
      def x_api_key
      end

      sig { params(_: String).returns(String) }
      def x_api_key=(_)
      end

      sig do
        params(
          after_id: String,
          before_id: String,
          limit: Integer,
          anthropic_version: String,
          x_api_key: String,
          request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(after_id: nil, before_id: nil, limit: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              after_id: String,
              before_id: String,
              limit: Integer,
              anthropic_version: String,
              x_api_key: String,
              request_options: Sam::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
