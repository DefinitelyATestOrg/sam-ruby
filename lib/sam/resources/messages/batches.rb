# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      class Batches
        # @return [Sam::Resources::Messages::Batches::BetaTrue]
        attr_reader :beta_true

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchCreateParams} for more details.
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
        # @param requests [Array<Sam::Models::Messages::BatchCreateParams::Request>] Body param: List of requests for prompt completion. Each is an individual reques
        #
        # @param anthropic_beta [Array<String>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] Header param: The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Header param: Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchCreateResponse]
        #
        # @see Sam::Models::Messages::BatchCreateParams
        def create(params)
          parsed, options = Sam::Messages::BatchCreateParams.dump_request(params)
          header_params =
            {anthropic_beta: "anthropic-beta", anthropic_version: "anthropic-version", x_api_key: "x-api-key"}
          @client.request(
            method: :post,
            path: "v1/messages/batches",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sam::Models::Messages::BatchCreateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchRetrieveParams} for more details.
        #
        # This endpoint is idempotent and can be used to poll for Message Batch
        # completion. To access the results of a Message Batch, make a request to the
        # `results_url` field in the response.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload retrieve(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchRetrieveResponse]
        #
        # @see Sam::Models::Messages::BatchRetrieveParams
        def retrieve(message_batch_id, params = {})
          parsed, options = Sam::Messages::BatchRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s", message_batch_id],
            headers: parsed.transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            model: Sam::Models::Messages::BatchRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchListParams} for more details.
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
        # @return [Sam::Models::Messages::BatchListResponse]
        #
        # @see Sam::Models::Messages::BatchListParams
        def list(params = {})
          query_params = [:after_id, :before_id, :limit]
          parsed, options = Sam::Messages::BatchListParams.dump_request(params)
          query = Sam::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/messages/batches",
            query: query,
            headers: parsed.except(*query_params).transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            model: Sam::Models::Messages::BatchListResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchDeleteParams} for more details.
        #
        # Delete a Message Batch.
        #
        # Message Batches can only be deleted once they've finished processing. If you'd
        # like to delete an in-progress batch, you must first cancel it.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload delete(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchDeleteResponse]
        #
        # @see Sam::Models::Messages::BatchDeleteParams
        def delete(message_batch_id, params = {})
          parsed, options = Sam::Messages::BatchDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/messages/batches/%1$s", message_batch_id],
            headers: parsed.transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            model: Sam::Models::Messages::BatchDeleteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchCancelParams} for more details.
        #
        # Batches may be canceled any time before processing ends. Once cancellation is
        # initiated, the batch enters a `canceling` state, at which time the system may
        # complete any in-progress, non-interruptible requests before finalizing
        # cancellation.
        #
        # The number of canceled requests is specified in `request_counts`. To determine
        # which requests were canceled, check the individual results within the batch.
        # Note that cancellation may not result in any canceled requests if they were
        # non-interruptible.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload cancel(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchCancelResponse]
        #
        # @see Sam::Models::Messages::BatchCancelParams
        def cancel(message_batch_id, params = {})
          parsed, options = Sam::Messages::BatchCancelParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/messages/batches/%1$s/cancel", message_batch_id],
            headers: parsed.transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            model: Sam::Models::Messages::BatchCancelResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchCancelBetaParams} for more details.
        #
        # Batches may be canceled any time before processing ends. Once cancellation is
        # initiated, the batch enters a `canceling` state, at which time the system may
        # complete any in-progress, non-interruptible requests before finalizing
        # cancellation.
        #
        # The number of canceled requests is specified in `request_counts`. To determine
        # which requests were canceled, check the individual results within the batch.
        # Note that cancellation may not result in any canceled requests if they were
        # non-interruptible.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload cancel_beta(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Models::Messages::BatchCancelBetaResponse]
        #
        # @see Sam::Models::Messages::BatchCancelBetaParams
        def cancel_beta(message_batch_id, params = {})
          parsed, options = Sam::Messages::BatchCancelBetaParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/messages/batches/%1$s/cancel?beta=true", message_batch_id],
            headers: parsed.transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            model: Sam::Models::Messages::BatchCancelBetaResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchResultsParams} for more details.
        #
        # Streams the results of a Message Batch as a `.jsonl` file.
        #
        # Each line in the file is a JSON object containing the result of a single request
        # in the Message Batch. Results are not guaranteed to be in the same order as
        # requests. Use the `custom_id` field to match results to requests.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload results_streaming(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Internal::JsonLStream<Sam::Models::Messages::BatchResultsResponse>]
        #
        # @see Sam::Models::Messages::BatchResultsParams
        def results_streaming(message_batch_id, params = {})
          parsed, options = Sam::Messages::BatchResultsParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s/results", message_batch_id],
            headers: {"accept" => "application/x-jsonl", **parsed}.transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            stream: Sam::Internal::JsonLStream,
            model: Sam::Models::Messages::BatchResultsResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sam::Models::Messages::BatchResultsBetaParams} for more details.
        #
        # Streams the results of a Message Batch as a `.jsonl` file.
        #
        # Each line in the file is a JSON object containing the result of a single request
        # in the Message Batch. Results are not guaranteed to be in the same order as
        # requests. Use the `custom_id` field to match results to requests.
        #
        # Learn more about the Message Batches API in our
        # [user guide](/en/docs/build-with-claude/batch-processing)
        #
        # @overload results_beta_streaming(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #
        # @param message_batch_id [String] ID of the Message Batch.
        #
        # @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        # @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        # @param x_api_key [String] Your unique API key for authentication.
        #
        # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sam::Internal::JsonLStream<Sam::Models::Messages::BatchResultsBetaResponse>]
        #
        # @see Sam::Models::Messages::BatchResultsBetaParams
        def results_beta_streaming(message_batch_id, params = {})
          parsed, options = Sam::Messages::BatchResultsBetaParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/messages/batches/%1$s/results?beta=true", message_batch_id],
            headers: {"accept" => "application/x-jsonl", **parsed}.transform_keys(
              anthropic_beta: "anthropic-beta",
              anthropic_version: "anthropic-version",
              x_api_key: "x-api-key"
            ),
            stream: Sam::Internal::JsonLStream,
            model: Sam::Models::Messages::BatchResultsBetaResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Sam::Client]
        def initialize(client:)
          @client = client
          @beta_true = Sam::Resources::Messages::Batches::BetaTrue.new(client: client)
        end
      end
    end
  end
end
