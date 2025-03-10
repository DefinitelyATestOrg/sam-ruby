# typed: strong

module Sam
  module Models
    module Messages
      class BatchCancelBetaResponse < Sam::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig { returns(T.nilable(Time)) }
        def archived_at
        end

        sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
        def archived_at=(_)
        end

        sig { returns(T.nilable(Time)) }
        def cancel_initiated_at
        end

        sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
        def cancel_initiated_at=(_)
        end

        sig { returns(Time) }
        def created_at
        end

        sig { params(_: Time).returns(Time) }
        def created_at=(_)
        end

        sig { returns(T.nilable(Time)) }
        def ended_at
        end

        sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
        def ended_at=(_)
        end

        sig { returns(Time) }
        def expires_at
        end

        sig { params(_: Time).returns(Time) }
        def expires_at=(_)
        end

        sig { returns(Symbol) }
        def processing_status
        end

        sig { params(_: Symbol).returns(Symbol) }
        def processing_status=(_)
        end

        sig { returns(Sam::Models::Messages::BatchCancelBetaResponse::RequestCounts) }
        def request_counts
        end

        sig do
          params(_: Sam::Models::Messages::BatchCancelBetaResponse::RequestCounts)
            .returns(Sam::Models::Messages::BatchCancelBetaResponse::RequestCounts)
        end
        def request_counts=(_)
        end

        sig { returns(T.nilable(String)) }
        def results_url
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def results_url=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            cancel_initiated_at: T.nilable(Time),
            created_at: Time,
            ended_at: T.nilable(Time),
            expires_at: Time,
            processing_status: Symbol,
            request_counts: Sam::Models::Messages::BatchCancelBetaResponse::RequestCounts,
            results_url: T.nilable(String),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(
          id:,
          archived_at:,
          cancel_initiated_at:,
          created_at:,
          ended_at:,
          expires_at:,
          processing_status:,
          request_counts:,
          results_url:,
          type: :message_batch
        )
        end

        sig do
          override
            .returns(
              {
                id: String,
                archived_at: T.nilable(Time),
                cancel_initiated_at: T.nilable(Time),
                created_at: Time,
                ended_at: T.nilable(Time),
                expires_at: Time,
                processing_status: Symbol,
                request_counts: Sam::Models::Messages::BatchCancelBetaResponse::RequestCounts,
                results_url: T.nilable(String),
                type: Symbol
              }
            )
        end
        def to_hash
        end

        class ProcessingStatus < Sam::Enum
          abstract!

          IN_PROGRESS = :in_progress
          CANCELING = :canceling
          ENDED = :ended

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end

        class RequestCounts < Sam::BaseModel
          sig { returns(Integer) }
          def canceled
          end

          sig { params(_: Integer).returns(Integer) }
          def canceled=(_)
          end

          sig { returns(Integer) }
          def errored
          end

          sig { params(_: Integer).returns(Integer) }
          def errored=(_)
          end

          sig { returns(Integer) }
          def expired
          end

          sig { params(_: Integer).returns(Integer) }
          def expired=(_)
          end

          sig { returns(Integer) }
          def processing
          end

          sig { params(_: Integer).returns(Integer) }
          def processing=(_)
          end

          sig { returns(Integer) }
          def succeeded
          end

          sig { params(_: Integer).returns(Integer) }
          def succeeded=(_)
          end

          sig do
            params(
              canceled: Integer,
              errored: Integer,
              expired: Integer,
              processing: Integer,
              succeeded: Integer
            )
              .returns(T.attached_class)
          end
          def self.new(canceled:, errored:, expired:, processing:, succeeded:)
          end

          sig do
            override
              .returns({
                         canceled: Integer,
                         errored: Integer,
                         expired: Integer,
                         processing: Integer,
                         succeeded: Integer
                       })
          end
          def to_hash
          end
        end
      end
    end
  end
end
