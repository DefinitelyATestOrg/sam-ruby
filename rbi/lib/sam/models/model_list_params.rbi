# typed: strong

module Sam
  module Models
    class ModelListParams < Sam::BaseModel
      extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # ID of the object to use as a cursor for pagination. When provided, returns the
      #   page of results immediately after this object.
      sig { returns(T.nilable(String)) }
      def after_id
      end

      sig { params(_: String).returns(String) }
      def after_id=(_)
      end

      # ID of the object to use as a cursor for pagination. When provided, returns the
      #   page of results immediately before this object.
      sig { returns(T.nilable(String)) }
      def before_id
      end

      sig { params(_: String).returns(String) }
      def before_id=(_)
      end

      # Number of items to return per page.
      #
      #   Defaults to `20`. Ranges from `1` to `1000`.
      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: Integer).returns(Integer) }
      def limit=(_)
      end

      # The version of the Anthropic API you want to use.
      #
      #   Read more about versioning and our version history
      #   [here](https://docs.anthropic.com/en/api/versioning).
      sig { returns(T.nilable(String)) }
      def anthropic_version
      end

      sig { params(_: String).returns(String) }
      def anthropic_version=(_)
      end

      # Your unique API key for authentication.
      #
      #   This key is required in the header of all API requests, to authenticate your
      #   account and access Anthropic's services. Get your API key through the
      #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #   Workspace.
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
          request_options: T.any(Sam::RequestOptions, Sam::Util::AnyHash)
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
