# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      class BatchesBetaTrue
        # Send a batch of Message creation requests.
        #
        #   The Message Batches API can be used to process multiple Messages API requests at
        #   once. Once a Message Batch is created, it begins processing immediately. Batches
        #   can take up to 24 hours to complete.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload create(requests:, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param requests [Array<Sam::Models::Messages::BatchesBetaTrueCreateParams::Request>]
        # @param anthropic_beta [Array<String>]
        # @param anthropic_version [String]
        # @param x_api_key [String]
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchesBetaTrueCreateResponse]
        #
        # @see Sam::Models::Messages::BatchesBetaTrueCreateParams
        def create(params)
          parsed, options = Sam::Models::Messages::BatchesBetaTrueCreateParams.dump_request(params)
          header_params = [:"anthropic-beta", :"anthropic-version", :"x-api-key"]
          @client.request(
            method: :post,
            path: "v1/messages/batches?beta=true",
            headers: parsed.slice(*header_params),
            body: parsed.except(*header_params),
            model: Sam::Models::Messages::BatchesBetaTrueCreateResponse,
            options: options
          )
        end

        # List all Message Batches within a Workspace. Most recently created batches are
        #   returned first.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload list(after_id: nil, before_id: nil, limit: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param after_id [String]
        # @param before_id [String]
        # @param limit [Integer]
        # @param anthropic_beta [Array<String>]
        # @param anthropic_version [String]
        # @param x_api_key [String]
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchesBetaTrueListResponse]
        #
        # @see Sam::Models::Messages::BatchesBetaTrueListParams
        def list(params = {})
          parsed, options = Sam::Models::Messages::BatchesBetaTrueListParams.dump_request(params)
          query_params = [:after_id, :before_id, :limit]
          @client.request(
            method: :get,
            path: "v1/messages/batches?beta=true",
            query: parsed.slice(*query_params),
            headers: parsed.except(*query_params),
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
