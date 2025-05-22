# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      class BatchesBetaTrue
        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchesBetaTrueCreateParams} for more details.
        #
        # Send a batch of Message creation requests.
        #
        # The Message Batches API can be used to process multiple Messages API requests at
        # once. Once a Message Batch is created, it begins processing immediately. Batches
        # can take up to 24 hours to complete.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload create(requests:, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param requests [Array<Sam::Models::Messages::BatchesBetaTrueCreateParams::Request>] Body param: List of requests for prompt completion. Each is an individual reques
        #
        # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Header param: Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchesBetaTrueCreateResponse]
        #
        # @see Sam::Models::Messages::BatchesBetaTrueCreateParams
        def create(params)
          parsed, options = Sam::Messages::BatchesBetaTrueCreateParams.dump_request(params)
          header_params =
            {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
          @client.request(
            method: :post,
            path: "v1/messages/batches?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sam::Models::Messages::BatchesBetaTrueCreateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchesBetaTrueListParams} for more details.
        #
        # List all Message Batches within a Workspace. Most recently created batches are
        # returned first.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload list(after_id: nil, before_id: nil, limit: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param after_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
        #
        # @param before_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
        #
        # @param limit [Integer] Query param: Number of items to return per page.
        #
        # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Header param: Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchesBetaTrueListResponse]
        #
        # @see Sam::Models::Messages::BatchesBetaTrueListParams
        def list(params = {})
          parsed, options = Sam::Messages::BatchesBetaTrueListParams.dump_request(params)
          query_params = [:after_id, :before_id, :limit]
          @client.request(
            method: :get,
            path: "v1/messages/batches?beta=true",
            query: parsed.slice(*query_params),
            headers: parsed.except(*query_params).transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            model: Sam::Models::Messages::BatchesBetaTrueListResponse,
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
end
