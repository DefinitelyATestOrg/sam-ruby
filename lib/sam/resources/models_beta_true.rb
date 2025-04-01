# frozen_string_literal: true

module Sam
  module Resources
    class ModelsBetaTrue
      # List available models.
      #
      #   The Models API response can be used to determine which models are available for
      #   use in the API. More recently released models are listed first.
      #
      # @overload list(after_id: nil, before_id: nil, limit: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param after_id [String]
      # @param before_id [String]
      # @param limit [Integer]
      # @param anthropic_version [String]
      # @param x_api_key [String]
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::ModelsBetaTrueListResponse]
      #
      # @see Sam::Models::ModelsBetaTrueListParams
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

      # @api private
      #
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
