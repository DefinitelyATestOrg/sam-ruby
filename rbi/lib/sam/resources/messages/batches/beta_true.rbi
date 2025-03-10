# typed: strong

module Sam
  module Resources
    class Messages
      class Batches
        class BetaTrue
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
