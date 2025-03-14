# frozen_string_literal: true

module Sam
  module Resources
    class ModelsBetaTrue
      # List available models.
      #
      #   The Models API response can be used to determine which models are available for
      #   use in the API. More recently released models are listed first.
      #
      # @param params [Sam::Models::ModelsBetaTrueListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :after_id Query param: ID of the object to use as a cursor for pagination. When provided,
      #     returns the page of results immediately after this object.
      #
      #   @option params [String] :before_id Query param: ID of the object to use as a cursor for pagination. When provided,
      #     returns the page of results immediately before this object.
      #
      #   @option params [Integer] :limit Query param: Number of items to return per page.
      #
      #     Defaults to `20`. Ranges from `1` to `1000`.
      #
      #   @option params [String] :anthropic_version Header param: The version of the Anthropic API you want to use.
      #
      #     Read more about versioning and our version history
      #     [here](https://docs.anthropic.com/en/api/versioning).
      #
      #   @option params [String] :x_api_key Header param: Your unique API key for authentication.
      #
      #     This key is required in the header of all API requests, to authenticate your
      #     account and access Anthropic's services. Get your API key through the
      #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #     Workspace.
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Sam::Models::ModelsBetaTrueListResponse]
      def list(params = {})
        parsed, options = Sam::Models::ModelsBetaTrueListParams.dump_request(params)
        query_params = [:after_id, :before_id, :limit]
        @client.request(
          method: :get,
          path: "v1/models?beta=true",
          query: parsed.slice(*query_params),
          headers: parsed.except(*query_params),
          model: Sam::Models::ModelsBetaTrueListResponse,
          options: options
        )
      end

      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
