# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      class Batches
        # @return [Sam::Resources::Messages::Batches::BetaTrue]
        attr_reader :beta_true

        # Send a batch of Message creation requests.
        #
        #   The Message Batches API can be used to process multiple Messages API requests at
        #   once. Once a Message Batch is created, it begins processing immediately. Batches
        #   can take up to 24 hours to complete.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param params [Sam::Models::Messages::BatchCreateParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<Sam::Models::Messages::BatchCreateParams::Request>] :requests Body param: List of requests for prompt completion. Each is an individual
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
        # @return [Sam::Models::Messages::BatchCreateResponse]
        def create(params)
          parsed, options = Sam::Models::Messages::BatchCreateParams.dump_request(params)
          header_params = [:"anthropic-beta", :"anthropic-version", :"x-api-key"]
          @client.request(
            method: :post,
            path: "v1/messages/batches",
            headers: parsed.slice(*header_params),
            body: parsed.except(*header_params),
            model: Sam::Models::Messages::BatchCreateResponse,
            options: options
          )
        end

        # This endpoint is idempotent and can be used to poll for Message Batch
        #   completion. To access the results of a Message Batch, make a request to the
        #   `results_url` field in the response.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param params [Sam::Models::Messages::BatchRetrieveParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<String>] :anthropic_beta Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
        #
        #   @option params [String] :anthropic_version The version of the Anthropic API you want to use.
        #
        #     Read more about versioning and our version history
        #     [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @option params [String] :x_api_key Your unique API key for authentication.
        #
        #     This key is required in the header of all API requests, to authenticate your
        #     account and access Anthropic's services. Get your API key through the
        #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #     Workspace.
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Sam::Models::Messages::BatchRetrieveResponse]
        def retrieve(message_batch_id, params = {})
          parsed, options = Sam::Models::Messages::BatchRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s", message_batch_id],
            headers: parsed,
            model: Sam::Models::Messages::BatchRetrieveResponse,
            options: options
          )
        end

        # List all Message Batches within a Workspace. Most recently created batches are
        #   returned first.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param params [Sam::Models::Messages::BatchListParams, Hash{Symbol=>Object}] .
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
        # @return [Sam::Models::Messages::BatchListResponse]
        def list(params = {})
          parsed, options = Sam::Models::Messages::BatchListParams.dump_request(params)
          query_params = [:after_id, :before_id, :limit]
          @client.request(
            method: :get,
            path: "v1/messages/batches",
            query: parsed.slice(*query_params),
            headers: parsed.except(*query_params),
            model: Sam::Models::Messages::BatchListResponse,
            options: options
          )
        end

        # Delete a Message Batch.
        #
        #   Message Batches can only be deleted once they've finished processing. If you'd
        #   like to delete an in-progress batch, you must first cancel it.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param params [Sam::Models::Messages::BatchDeleteParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<String>] :anthropic_beta Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
        #
        #   @option params [String] :anthropic_version The version of the Anthropic API you want to use.
        #
        #     Read more about versioning and our version history
        #     [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @option params [String] :x_api_key Your unique API key for authentication.
        #
        #     This key is required in the header of all API requests, to authenticate your
        #     account and access Anthropic's services. Get your API key through the
        #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #     Workspace.
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Sam::Models::Messages::BatchDeleteResponse]
        def delete(message_batch_id, params = {})
          parsed, options = Sam::Models::Messages::BatchDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/messages/batches/%1$s", message_batch_id],
            headers: parsed,
            model: Sam::Models::Messages::BatchDeleteResponse,
            options: options
          )
        end

        # Batches may be canceled any time before processing ends. Once cancellation is
        #   initiated, the batch enters a `canceling` state, at which time the system may
        #   complete any in-progress, non-interruptible requests before finalizing
        #   cancellation.
        #
        #   The number of canceled requests is specified in `request_counts`. To determine
        #   which requests were canceled, check the individual results within the batch.
        #   Note that cancellation may not result in any canceled requests if they were
        #   non-interruptible.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param params [Sam::Models::Messages::BatchCancelParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<String>] :anthropic_beta Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
        #
        #   @option params [String] :anthropic_version The version of the Anthropic API you want to use.
        #
        #     Read more about versioning and our version history
        #     [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @option params [String] :x_api_key Your unique API key for authentication.
        #
        #     This key is required in the header of all API requests, to authenticate your
        #     account and access Anthropic's services. Get your API key through the
        #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #     Workspace.
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Sam::Models::Messages::BatchCancelResponse]
        def cancel(message_batch_id, params = {})
          parsed, options = Sam::Models::Messages::BatchCancelParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/messages/batches/%1$s/cancel", message_batch_id],
            headers: parsed,
            model: Sam::Models::Messages::BatchCancelResponse,
            options: options
          )
        end

        # Batches may be canceled any time before processing ends. Once cancellation is
        #   initiated, the batch enters a `canceling` state, at which time the system may
        #   complete any in-progress, non-interruptible requests before finalizing
        #   cancellation.
        #
        #   The number of canceled requests is specified in `request_counts`. To determine
        #   which requests were canceled, check the individual results within the batch.
        #   Note that cancellation may not result in any canceled requests if they were
        #   non-interruptible.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param params [Sam::Models::Messages::BatchCancelBetaParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<String>] :anthropic_beta Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
        #
        #   @option params [String] :anthropic_version The version of the Anthropic API you want to use.
        #
        #     Read more about versioning and our version history
        #     [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @option params [String] :x_api_key Your unique API key for authentication.
        #
        #     This key is required in the header of all API requests, to authenticate your
        #     account and access Anthropic's services. Get your API key through the
        #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #     Workspace.
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Sam::Models::Messages::BatchCancelBetaResponse]
        def cancel_beta(message_batch_id, params = {})
          parsed, options = Sam::Models::Messages::BatchCancelBetaParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/messages/batches/%1$s/cancel?beta=true", message_batch_id],
            headers: parsed,
            model: Sam::Models::Messages::BatchCancelBetaResponse,
            options: options
          )
        end

        # Streams the results of a Message Batch as a `.jsonl` file.
        #
        #   Each line in the file is a JSON object containing the result of a single request
        #   in the Message Batch. Results are not guaranteed to be in the same order as
        #   requests. Use the `custom_id` field to match results to requests.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param params [Sam::Models::Messages::BatchResultsParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<String>] :anthropic_beta Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
        #
        #   @option params [String] :anthropic_version The version of the Anthropic API you want to use.
        #
        #     Read more about versioning and our version history
        #     [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @option params [String] :x_api_key Your unique API key for authentication.
        #
        #     This key is required in the header of all API requests, to authenticate your
        #     account and access Anthropic's services. Get your API key through the
        #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #     Workspace.
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Sam::JsonLStream<Sam::Models::Messages::BatchResultsResponse>]
        def results(message_batch_id, params = {})
          parsed, options = Sam::Models::Messages::BatchResultsParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s/results", message_batch_id],
            headers: {"accept" => "application/x-jsonl", **parsed},
            stream: Sam::JsonLStream,
            model: Sam::Models::Messages::BatchResultsResponse,
            options: options
          )
        end

        # Streams the results of a Message Batch as a `.jsonl` file.
        #
        #   Each line in the file is a JSON object containing the result of a single request
        #   in the Message Batch. Results are not guaranteed to be in the same order as
        #   requests. Use the `custom_id` field to match results to requests.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param params [Sam::Models::Messages::BatchResultsBetaParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<String>] :anthropic_beta Optional header to specify the beta version(s) you want to use.
        #
        #     To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #     the header multiple times for each beta.
        #
        #   @option params [String] :anthropic_version The version of the Anthropic API you want to use.
        #
        #     Read more about versioning and our version history
        #     [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @option params [String] :x_api_key Your unique API key for authentication.
        #
        #     This key is required in the header of all API requests, to authenticate your
        #     account and access Anthropic's services. Get your API key through the
        #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #     Workspace.
        #
        #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Sam::JsonLStream<Sam::Models::Messages::BatchResultsBetaResponse>]
        def results_beta(message_batch_id, params = {})
          parsed, options = Sam::Models::Messages::BatchResultsBetaParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s/results?beta=true", message_batch_id],
            headers: {"accept" => "application/x-jsonl", **parsed},
            stream: Sam::JsonLStream,
            model: Sam::Models::Messages::BatchResultsBetaResponse,
            options: options
          )
        end

        # @param client [Sam::Client]
        def initialize(client:)
          @client = client
          @beta_true = Sam::Resources::Messages::Batches::BetaTrue.new(client: client)
        end
      end
    end
  end
end
