# typed: strong

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
        sig do
          params(
            requests: T::Array[Sam::Models::Messages::BatchesBetaTrueCreateParams::Request],
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchesBetaTrueCreateResponse)
        end
        def create(
          requests:,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

        # List all Message Batches within a Workspace. Most recently created batches are
        #   returned first.
        #
        #   Learn more about the Message Batches API in our
        #   [user guide](/en/docs/build-with-claude/batch-processing)
        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchesBetaTrueListResponse)
        end
        def list(
          after_id: nil,
          before_id: nil,
          limit: nil,
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
