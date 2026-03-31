# frozen_string_literal: true

module Sam
  module Resources
    class ModelsBetaTrue
      # Some parameter documentations has been truncated, see
      # {Sam::Models::ModelsBetaTrueListParams} for more details.
      #
      # List available models.
      #
      # The Models API response can be used to determine which models are available for
      # use in the API. More recently released models are listed first.
      #
      # @overload list(after_id: nil, before_id: nil, limit: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param after_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
      #
      # @param before_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
      #
      # @param limit [Integer] Query param: Number of items to return per page.
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use.
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication.
      #
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::ModelsBetaTrueListResponse]
      #
      # @see Sam::Models::ModelsBetaTrueListParams
      def list(params = {})
        query_params = [:after_id, :before_id, :limit]
        parsed, options = Sam::ModelsBetaTrueListParams.dump_request(params)
        query = Sam::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v1/models?beta=true",
          query: query,
          headers: parsed.except(*query_params).transform_keys(
            anthropic_version: "anthropic-version",
            x_api_key: "x-api-key"
          ),
          model: Sam::Models::ModelsBetaTrueListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
