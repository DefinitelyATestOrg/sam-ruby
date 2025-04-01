# typed: strong

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
          sig do
            params(
              message_batch_id: String,
              anthropic_beta: T::Array[String],
              anthropic_version: String,
              x_api_key: String,
              request_options: T.nilable(T.any(Sam::RequestOptions, Sam::Util::AnyHash))
            )
              .returns(Sam::Models::Messages::Batches::BetaTrueRetrieveResponse)
          end
          def retrieve(
            # ID of the Message Batch.
            message_batch_id,
            # Optional header to specify the beta version(s) you want to use.
            #
            #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
            #   the header multiple times for each beta.
            anthropic_beta: nil,
            # The version of the Anthropic API you want to use.
            #
            #   Read more about versioning and our version history
            #   [here](https://docs.anthropic.com/en/api/versioning).
            anthropic_version: nil,
            # Your unique API key for authentication.
            #
            #   This key is required in the header of all API requests, to authenticate your
            #   account and access Anthropic's services. Get your API key through the
            #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
            #   Workspace.
            x_api_key: nil,
            request_options: {}
          )
          end

          # Delete a Message Batch.
          #
          #   Message Batches can only be deleted once they've finished processing. If you'd
          #   like to delete an in-progress batch, you must first cancel it.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          sig do
            params(
              message_batch_id: String,
              anthropic_beta: T::Array[String],
              anthropic_version: String,
              x_api_key: String,
              request_options: T.nilable(T.any(Sam::RequestOptions, Sam::Util::AnyHash))
            )
              .returns(Sam::Models::Messages::Batches::BetaTrueDeleteResponse)
          end
          def delete(
            # ID of the Message Batch.
            message_batch_id,
            # Optional header to specify the beta version(s) you want to use.
            #
            #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
            #   the header multiple times for each beta.
            anthropic_beta: nil,
            # The version of the Anthropic API you want to use.
            #
            #   Read more about versioning and our version history
            #   [here](https://docs.anthropic.com/en/api/versioning).
            anthropic_version: nil,
            # Your unique API key for authentication.
            #
            #   This key is required in the header of all API requests, to authenticate your
            #   account and access Anthropic's services. Get your API key through the
            #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
            #   Workspace.
            x_api_key: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Sam::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
