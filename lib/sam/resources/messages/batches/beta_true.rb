# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      class Batches
        class BetaTrue
          # This endpoint is idempotent and can be used to poll for Message Batch
          #   completion. To access the results of a Message Batch, make a request to the
          #   `results_url` field in the response.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @param message_batch_id [String] ID of the Message Batch.
          #
          # @param params [Sam::Models::Messages::Batches::BetaTrueRetrieveParams, Hash{Symbol=>Object}] .
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
          # @return [Sam::Models::Messages::Batches::BetaTrueRetrieveResponse]
          #
          # @see Sam::Models::Messages::Batches::BetaTrueRetrieveParams
          def retrieve(message_batch_id, params = {})
            parsed, options = Sam::Models::Messages::Batches::BetaTrueRetrieveParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/messages/batches/%1$s?beta=true", message_batch_id],
              headers: parsed,
              model: Sam::Models::Messages::Batches::BetaTrueRetrieveResponse,
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
          # @param params [Sam::Models::Messages::Batches::BetaTrueDeleteParams, Hash{Symbol=>Object}] .
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
          # @return [Sam::Models::Messages::Batches::BetaTrueDeleteResponse]
          #
          # @see Sam::Models::Messages::Batches::BetaTrueDeleteParams
          def delete(message_batch_id, params = {})
            parsed, options = Sam::Models::Messages::Batches::BetaTrueDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["v1/messages/batches/%1$s?beta=true", message_batch_id],
              headers: parsed,
              model: Sam::Models::Messages::Batches::BetaTrueDeleteResponse,
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
end
