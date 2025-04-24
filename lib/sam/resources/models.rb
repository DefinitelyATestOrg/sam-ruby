# frozen_string_literal: true

module Sam
  module Resources
    class Models
      # Some parameter documentations has been truncated, see
      # {Sam::Models::ModelRetrieveParams} for more details.
      #
      # Get a specific model.
      #
      # The Models API response can be used to determine information about a specific
      # model or resolve a model alias to a model ID.
      #
      # @overload retrieve(model_id, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param model_id [String] Model identifier or alias.
      #
      # @param anthropic_version [String] The version of the Anthropic API you want to use. ...
      #
      # @param x_api_key [String] Your unique API key for authentication. ...
      #
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
          headers: parsed.transform_keys(anthropic_version: "anthropic-version", x_api_key: "x-api-key"),
          model: Sam::Models::ModelRetrieveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sam::Models::ModelListParams} for more details.
      #
      # List available models.
      #
      # The Models API response can be used to determine which models are available for
      # use in the API. More recently released models are listed first.
      #
      # @overload list(after_id: nil, before_id: nil, limit: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param after_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
      # ...
      #
      # @param before_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
      # ...
      #
      # @param limit [Integer] Query param: Number of items to return per page. ...
      #
      # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use. ...
      #
      # @param x_api_key [String] Header param: Your unique API key for authentication. ...
      #
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
          headers: parsed.except(*query_params).transform_keys(
            anthropic_version: "anthropic-version",
            x_api_key: "x-api-key"
          ),
          model: Sam::Models::ModelListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sam::Models::ModelRetrieveBetaParams} for more details.
      #
      # Get a specific model.
      #
      # The Models API response can be used to determine information about a specific
      # model or resolve a model alias to a model ID.
      #
      # @overload retrieve_beta(model_id, anthropic_version: nil, x_api_key: nil, request_options: {})
      #
      # @param model_id [String] Model identifier or alias.
      #
      # @param anthropic_version [String] The version of the Anthropic API you want to use. ...
      #
      # @param x_api_key [String] Your unique API key for authentication. ...
      #
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
          headers: parsed.transform_keys(anthropic_version: "anthropic-version", x_api_key: "x-api-key"),
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
