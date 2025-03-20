# typed: strong

module Sam
  module Models
    module Messages
      class BatchesBetaTrueListResponse < Sam::BaseModel
        sig { returns(T::Array[Sam::Models::Messages::BatchesBetaTrueListResponse::Data]) }
        def data
        end

        sig do
          params(_: T::Array[Sam::Models::Messages::BatchesBetaTrueListResponse::Data])
            .returns(T::Array[Sam::Models::Messages::BatchesBetaTrueListResponse::Data])
        end
        def data=(_)
        end

        # First ID in the `data` list. Can be used as the `before_id` for the previous
        #   page.
        sig { returns(T.nilable(String)) }
        def first_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def first_id=(_)
        end

        # Indicates if there are more results in the requested page direction.
        sig { returns(T::Boolean) }
        def has_more
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def has_more=(_)
        end

        # Last ID in the `data` list. Can be used as the `after_id` for the next page.
        sig { returns(T.nilable(String)) }
        def last_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def last_id=(_)
        end

        sig do
          params(
            data: T::Array[Sam::Models::Messages::BatchesBetaTrueListResponse::Data],
            first_id: T.nilable(String),
            has_more: T::Boolean,
            last_id: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(data:, first_id:, has_more:, last_id:)
        end

        sig do
          override
            .returns(
              {
                data: T::Array[Sam::Models::Messages::BatchesBetaTrueListResponse::Data],
                first_id: T.nilable(String),
                has_more: T::Boolean,
                last_id: T.nilable(String)
              }
            )
        end
        def to_hash
        end

        class Data < Sam::BaseModel
          # Unique object identifier.
          #
          #   The format and length of IDs may change over time.
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          # RFC 3339 datetime string representing the time at which the Message Batch was
          #   archived and its results became unavailable.
          sig { returns(T.nilable(Time)) }
          def archived_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def archived_at=(_)
          end

          # RFC 3339 datetime string representing the time at which cancellation was
          #   initiated for the Message Batch. Specified only if cancellation was initiated.
          sig { returns(T.nilable(Time)) }
          def cancel_initiated_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def cancel_initiated_at=(_)
          end

          # RFC 3339 datetime string representing the time at which the Message Batch was
          #   created.
          sig { returns(Time) }
          def created_at
          end

          sig { params(_: Time).returns(Time) }
          def created_at=(_)
          end

          # RFC 3339 datetime string representing the time at which processing for the
          #   Message Batch ended. Specified only once processing ends.
          #
          #   Processing ends when every request in a Message Batch has either succeeded,
          #   errored, canceled, or expired.
          sig { returns(T.nilable(Time)) }
          def ended_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def ended_at=(_)
          end

          # RFC 3339 datetime string representing the time at which the Message Batch will
          #   expire and end processing, which is 24 hours after creation.
          sig { returns(Time) }
          def expires_at
          end

          sig { params(_: Time).returns(Time) }
          def expires_at=(_)
          end

          # Processing status of the Message Batch.
          sig { returns(Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol) }
          def processing_status
          end

          sig do
            params(_: Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol)
              .returns(Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol)
          end
          def processing_status=(_)
          end

          # Tallies requests within the Message Batch, categorized by their status.
          #
          #   Requests start as `processing` and move to one of the other statuses only once
          #   processing of the entire batch ends. The sum of all values always matches the
          #   total number of requests in the batch.
          sig { returns(Sam::Models::Messages::BatchesBetaTrueListResponse::Data::RequestCounts) }
          def request_counts
          end

          sig do
            params(
              _: T.any(Sam::Models::Messages::BatchesBetaTrueListResponse::Data::RequestCounts, Sam::Util::AnyHash)
            )
              .returns(
                T.any(Sam::Models::Messages::BatchesBetaTrueListResponse::Data::RequestCounts, Sam::Util::AnyHash)
              )
          end
          def request_counts=(_)
          end

          # URL to a `.jsonl` file containing the results of the Message Batch requests.
          #   Specified only once processing ends.
          #
          #   Results in the file are not guaranteed to be in the same order as requests. Use
          #   the `custom_id` field to match results to requests.
          sig { returns(T.nilable(String)) }
          def results_url
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def results_url=(_)
          end

          # Object type.
          #
          #   For Message Batches, this is always `"message_batch"`.
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
              processing_status: Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol,
              request_counts: Sam::Models::Messages::BatchesBetaTrueListResponse::Data::RequestCounts,
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
                  processing_status: Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol,
                  request_counts: Sam::Models::Messages::BatchesBetaTrueListResponse::Data::RequestCounts,
                  results_url: T.nilable(String),
                  type: Symbol
                }
              )
          end
          def to_hash
          end

          # Processing status of the Message Batch.
          module ProcessingStatus
            extend Sam::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol) }

            IN_PROGRESS =
              T.let(
                :in_progress,
                Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol
              )
            CANCELING =
              T.let(
                :canceling,
                Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol
              )
            ENDED =
              T.let(:ended, Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol)

            class << self
              sig do
                override
                  .returns(
                    T::Array[Sam::Models::Messages::BatchesBetaTrueListResponse::Data::ProcessingStatus::TaggedSymbol]
                  )
              end
              def values
              end
            end
          end

          class RequestCounts < Sam::BaseModel
            # Number of requests in the Message Batch that have been canceled.
            #
            #   This is zero until processing of the entire Message Batch has ended.
            sig { returns(Integer) }
            def canceled
            end

            sig { params(_: Integer).returns(Integer) }
            def canceled=(_)
            end

            # Number of requests in the Message Batch that encountered an error.
            #
            #   This is zero until processing of the entire Message Batch has ended.
            sig { returns(Integer) }
            def errored
            end

            sig { params(_: Integer).returns(Integer) }
            def errored=(_)
            end

            # Number of requests in the Message Batch that have expired.
            #
            #   This is zero until processing of the entire Message Batch has ended.
            sig { returns(Integer) }
            def expired
            end

            sig { params(_: Integer).returns(Integer) }
            def expired=(_)
            end

            # Number of requests in the Message Batch that are processing.
            sig { returns(Integer) }
            def processing
            end

            sig { params(_: Integer).returns(Integer) }
            def processing=(_)
            end

            # Number of requests in the Message Batch that have completed successfully.
            #
            #   This is zero until processing of the entire Message Batch has ended.
            sig { returns(Integer) }
            def succeeded
            end

            sig { params(_: Integer).returns(Integer) }
            def succeeded=(_)
            end

            # Tallies requests within the Message Batch, categorized by their status.
            #
            #   Requests start as `processing` and move to one of the other statuses only once
            #   processing of the entire batch ends. The sum of all values always matches the
            #   total number of requests in the batch.
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
end
