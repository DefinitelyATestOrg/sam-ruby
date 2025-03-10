# typed: strong

module Sam
  module Resources
    class Messages
      class Batches
        sig { returns(Sam::Resources::Messages::Batches::BetaTrue) }
        def beta_true
        end

        sig do
          params(
            requests: T::Array[Sam::Models::Messages::BatchCreateParams::Request],
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchCreateResponse)
        end
        def create(
          requests:,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

        sig do
          params(
            message_batch_id: String,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchRetrieveResponse)
        end
        def retrieve(
          message_batch_id,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

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
            .returns(Sam::Models::Messages::BatchListResponse)
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

        sig do
          params(
            message_batch_id: String,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchDeleteResponse)
        end
        def delete(
          message_batch_id,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

        sig do
          params(
            message_batch_id: String,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchCancelResponse)
        end
        def cancel(
          message_batch_id,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

        sig do
          params(
            message_batch_id: String,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::Models::Messages::BatchCancelBetaResponse)
        end
        def cancel_beta(
          message_batch_id,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

        sig do
          params(
            message_batch_id: String,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::JsonLStream[Sam::Models::Messages::BatchResultsResponse])
        end
        def results(
          message_batch_id,
          anthropic_beta: nil,
          anthropic_version: nil,
          x_api_key: nil,
          request_options: {}
        )
        end

        sig do
          params(
            message_batch_id: String,
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Sam::JsonLStream[Sam::Models::Messages::BatchResultsBetaResponse])
        end
        def results_beta(
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
