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
              request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
            )
              .returns(Sam::Models::Messages::Batches::BetaTrueRetrieveResponse)
          end
          def retrieve(
            message_batch_id,
            anthropic_beta: nil,
            anthropic_version: nil,
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
              request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
            )
              .returns(Sam::Models::Messages::Batches::BetaTrueDeleteResponse)
          end
          def delete(
            message_batch_id,
            anthropic_beta: nil,
            anthropic_version: nil,
            x_api_key: nil,
            request_options: {}
          )
          end

          sig { params(client: Sam::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
