# frozen_string_literal: true

module Sam
  module Resources
    class Models
      # Get a specific model.
      #
      #   The Models API response can be used to determine information about a specific
      #   model or resolve a model alias to a model ID.
      #
      # @overload retrieve(model_id, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param model_id [String]
      # @param anthropic_version [String]
      # @param x_api_key [String]
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::ModelRetrieveResponse]
      #
      # @see Sam::Models::ModelRetrieveParams
      def retrieve(model_id, params = {})
        parsed, options = Sam::Models::ModelRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/models/%1$s", model_id],
          headers: parsed,
          model: Sam::Models::ModelRetrieveResponse,
          options: options
        )
      end

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
      # @return [Sam::Models::ModelListResponse]
      #
      # @see Sam::Models::ModelListParams
      def list(params = {})
        parsed, options = Sam::Models::ModelListParams.dump_request(params)
        query_params = [:after_id, :before_id, :limit]
        @client.request(
          method: :get,
          path: "v1/models",
          query: parsed.slice(*query_params),
          headers: parsed.except(*query_params),
          model: Sam::Models::ModelListResponse,
          options: options
        )
      end

      # Get a specific model.
      #
      #   The Models API response can be used to determine information about a specific
      #   model or resolve a model alias to a model ID.
      #
      # @overload retrieve_beta(model_id, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param model_id [String]
      # @param anthropic_version [String]
      # @param x_api_key [String]
      # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sam::Models::ModelRetrieveBetaResponse]
      #
      # @see Sam::Models::ModelRetrieveBetaParams
      def retrieve_beta(model_id, params = {})
        parsed, options = Sam::Models::ModelRetrieveBetaParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/models/%1$s?beta=true", model_id],
          headers: parsed,
          model: Sam::Models::ModelRetrieveBetaResponse,
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
