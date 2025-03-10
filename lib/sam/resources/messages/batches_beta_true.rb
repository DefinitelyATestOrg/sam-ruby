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
        # @param params [Sam::Models::Messages::BatchesBetaTrueCreateParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<Sam::Models::Messages::BatchesBetaTrueCreateParams::Request>] :requests Body param: List of requests for prompt completion. Each is an individual
        #     request to create a Message.
        #
        #   @option params [Array<String>] :anthropic_beta Header param: Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
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
        # @return [Sam::Models::Messages::BatchesBetaTrueCreateResponse]
        #
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
        # @param params [Sam::Models::Messages::BatchesBetaTrueListParams, Hash{Symbol=>Object}] .
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
        #   @option params [Array<String>] :anthropic_beta Header param: Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
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
        # @return [Sam::Models::Messages::BatchesBetaTrueListResponse]
        #
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

        # @param client [Sam::Client]
        #
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
