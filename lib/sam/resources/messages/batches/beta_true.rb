# frozen_string_literal: true

module Sam
  module Resources
    class Messages
      class Batches
        class BetaTrue
          # This endpoint is idempotent and can be used to poll for Message Batch
          # completion. To access the results of a Message Batch, make a request to the
          # `results_url` field in the response.
          #
          # Learn more about the Message Batches API in our
          # [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload retrieve(message_batch_id, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
          #
          # @param message_batch_id [String]
          # @param anthropic_beta [Array<String>]
          # @param anthropic_version [String]
          # @param x_api_key [String]
          # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sam::Models::Messages::Batches::BetaTrueRetrieveResponse]
          #
          # @see Sam::Models::Messages::Batches::BetaTrueRetrieveParams
          def retrieve(message_batch_id, params = {})
            parsed, options = Sam::Models::Messages::Batches::BetaTrueRetrieveParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/messages/batches/%1$s?beta=true", message_batch_id],
              headers: parsed.transform_keys(
                anthropic_beta: "anthropic-beta",
                anthropic_version: "anthropic-version",
                x_api_key: "x-api-key"
              ),
              model: Sam::Models::Messages::Batches::BetaTrueRetrieveResponse,
              options: options
            )
          end

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
          # @param message_batch_id [String]
          # @param anthropic_beta [Array<String>]
          # @param anthropic_version [String]
          # @param x_api_key [String]
          # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sam::Models::Messages::Batches::BetaTrueDeleteResponse]
          #
          # @see Sam::Models::Messages::Batches::BetaTrueDeleteParams
          def delete(message_batch_id, params = {})
            parsed, options = Sam::Models::Messages::Batches::BetaTrueDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["v1/messages/batches/%1$s?beta=true", message_batch_id],
              headers: parsed.transform_keys(
                anthropic_beta: "anthropic-beta",
                anthropic_version: "anthropic-version",
                x_api_key: "x-api-key"
              ),
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
