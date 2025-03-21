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
            request_options: T.nilable(T.any(Sam::RequestOptions, Sam::Util::AnyHash))
          )
            .returns(Sam::Models::Messages::BatchesBetaTrueCreateResponse)
        end
        def create(
          # Body param: List of requests for prompt completion. Each is an individual
          #   request to create a Message.
          requests:,
          # Header param: Optional header to specify the beta version(s) you want to use.
          #
          #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
          #   the header multiple times for each beta.
          anthropic_beta: nil,
          # Header param: The version of the Anthropic API you want to use.
          #
          #   Read more about versioning and our version history
          #   [here](https://docs.anthropic.com/en/api/versioning).
          anthropic_version: nil,
          # Header param: Your unique API key for authentication.
          #
          #   This key is required in the header of all API requests, to authenticate your
          #   account and access Anthropic's services. Get your API key through the
          #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
          #   Workspace.
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
            request_options: T.nilable(T.any(Sam::RequestOptions, Sam::Util::AnyHash))
          )
            .returns(Sam::Models::Messages::BatchesBetaTrueListResponse)
        end
        def list(
          # Query param: ID of the object to use as a cursor for pagination. When provided,
          #   returns the page of results immediately after this object.
          after_id: nil,
          # Query param: ID of the object to use as a cursor for pagination. When provided,
          #   returns the page of results immediately before this object.
          before_id: nil,
          # Query param: Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          #
          #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
          #   the header multiple times for each beta.
          anthropic_beta: nil,
          # Header param: The version of the Anthropic API you want to use.
          #
          #   Read more about versioning and our version history
          #   [here](https://docs.anthropic.com/en/api/versioning).
          anthropic_version: nil,
          # Header param: Your unique API key for authentication.
          #
          #   This key is required in the header of all API requests, to authenticate your
          #   account and access Anthropic's services. Get your API key through the
          #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
          #   Workspace.
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
