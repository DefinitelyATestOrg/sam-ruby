# typed: strong

module Sam
  module Resources
    class ModelsBetaTrue
      # List available models.
      #
      #   The Models API response can be used to determine which models are available for
      #   use in the API. More recently released models are listed first.
      sig do
        params(
          after_id: String,
          before_id: String,
          limit: Integer,
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, Sam::Util::AnyHash))
        )
          .returns(Sam::Models::ModelsBetaTrueListResponse)
      end
      def list(
        # Query param: ID of the object to use as a cursor for pagination. When provided,
        #   returns the page of results immediately after this object.
        after_id: nil,
        # Query param: ID of the object to use as a cursor for pagination. When provided,
        #   returns the page of results immediately before this object.
        before_id: nil,
        # Query param: Number of items to return per page.
        #
        #   Defaults to `20`. Ranges from `1` to `1000`.
        limit: nil,
        # Header param: The version of the Anthropic API you want to use.
        #
        #   Read more about versioning and our version history
        #   [here](https://docs.anthropic.com/en/api/versioning).
        anthropic_version: nil,
        # Header param: Your unique API key for authentication.
        #
        #   This key is required in the header of all API requests, to authenticate your
        #   account and access Anthropic's services. Get your API key through the
        #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #   Workspace.
        x_api_key: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Sam::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
