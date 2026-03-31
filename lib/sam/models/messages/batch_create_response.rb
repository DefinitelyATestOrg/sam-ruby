# frozen_string_literal: true

module Sam
  module Models
    module Messages
      # @see Sam::Resources::Messages::Batches#create
      class BatchCreateResponse < Sam::Internal::Type::BaseModel
        # @!attribute id
        #   Unique object identifier.
        #
        #   The format and length of IDs may change over time.
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   RFC 3339 datetime string representing the time at which the Message Batch was
        #   archived and its results became unavailable.
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute cancel_initiated_at
        #   RFC 3339 datetime string representing the time at which cancellation was
        #   initiated for the Message Batch. Specified only if cancellation was initiated.
        #
        #   @return [Time, nil]
        required :cancel_initiated_at, Time, nil?: true

        # @!attribute created_at
        #   RFC 3339 datetime string representing the time at which the Message Batch was
        #   created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute ended_at
        #   RFC 3339 datetime string representing the time at which processing for the
        #   Message Batch ended. Specified only once processing ends.
        #
        #   Processing ends when every request in a Message Batch has either succeeded,
        #   errored, canceled, or expired.
        #
        #   @return [Time, nil]
        required :ended_at, Time, nil?: true

        # @!attribute expires_at
        #   RFC 3339 datetime string representing the time at which the Message Batch will
        #   expire and end processing, which is 24 hours after creation.
        #
        #   @return [Time]
        required :expires_at, Time

        # @!attribute processing_status
        #   Processing status of the Message Batch.
        #
        #   @return [Symbol, Sam::Models::Messages::BatchCreateResponse::ProcessingStatus]
        required :processing_status, enum: -> { Sam::Models::Messages::BatchCreateResponse::ProcessingStatus }

        # @!attribute request_counts
        #   Tallies requests within the Message Batch, categorized by their status.
        #
        #   Requests start as `processing` and move to one of the other statuses only once
        #   processing of the entire batch ends. The sum of all values always matches the
        #   total number of requests in the batch.
        #
        #   @return [Sam::Models::Messages::BatchCreateResponse::RequestCounts]
        required :request_counts, -> { Sam::Models::Messages::BatchCreateResponse::RequestCounts }

        # @!attribute results_url
        #   URL to a `.jsonl` file containing the results of the Message Batch requests.
        #   Specified only once processing ends.
        #
        #   Results in the file are not guaranteed to be in the same order as requests. Use
        #   the `custom_id` field to match results to requests.
        #
        #   @return [String, nil]
        required :results_url, String, nil?: true

        # @!attribute type
        #   Object type.
        #
        #   For Message Batches, this is always `"message_batch"`.
        #
        #   @return [Symbol, :message_batch]
        required :type, const: :message_batch

        # @!method initialize(id:, archived_at:, cancel_initiated_at:, created_at:, ended_at:, expires_at:, processing_status:, request_counts:, results_url:, type: :message_batch)
        #   Some parameter documentations has been truncated, see
        #   {Sam::Models::Messages::BatchCreateResponse} for more details.
        #
        #   @param id [String] Unique object identifier.
        #
        #   @param archived_at [Time, nil] RFC 3339 datetime string representing the time at which the Message Batch was ar
        #
        #   @param cancel_initiated_at [Time, nil] RFC 3339 datetime string representing the time at which cancellation was initiat
        #
        #   @param created_at [Time] RFC 3339 datetime string representing the time at which the Message Batch was cr
        #
        #   @param ended_at [Time, nil] RFC 3339 datetime string representing the time at which processing for the Messa
        #
        #   @param expires_at [Time] RFC 3339 datetime string representing the time at which the Message Batch will e
        #
        #   @param processing_status [Symbol, Sam::Models::Messages::BatchCreateResponse::ProcessingStatus] Processing status of the Message Batch.
        #
        #   @param request_counts [Sam::Models::Messages::BatchCreateResponse::RequestCounts] Tallies requests within the Message Batch, categorized by their status.
        #
        #   @param results_url [String, nil] URL to a `.jsonl` file containing the results of the Message Batch requests. Spe
        #
        #   @param type [Symbol, :message_batch] Object type.

        # Processing status of the Message Batch.
        #
        # @see Sam::Models::Messages::BatchCreateResponse#processing_status
        module ProcessingStatus
          extend Sam::Internal::Type::Enum

          IN_PROGRESS = :in_progress
          CANCELING = :canceling
          ENDED = :ended

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Sam::Models::Messages::BatchCreateResponse#request_counts
        class RequestCounts < Sam::Internal::Type::BaseModel
          # @!attribute canceled
          #   Number of requests in the Message Batch that have been canceled.
          #
          #   This is zero until processing of the entire Message Batch has ended.
          #
          #   @return [Integer]
          required :canceled, Integer

          # @!attribute errored
          #   Number of requests in the Message Batch that encountered an error.
          #
          #   This is zero until processing of the entire Message Batch has ended.
          #
          #   @return [Integer]
          required :errored, Integer

          # @!attribute expired
          #   Number of requests in the Message Batch that have expired.
          #
          #   This is zero until processing of the entire Message Batch has ended.
          #
          #   @return [Integer]
          required :expired, Integer

          # @!attribute processing
          #   Number of requests in the Message Batch that are processing.
          #
          #   @return [Integer]
          required :processing, Integer

          # @!attribute succeeded
          #   Number of requests in the Message Batch that have completed successfully.
          #
          #   This is zero until processing of the entire Message Batch has ended.
          #
          #   @return [Integer]
          required :succeeded, Integer

          # @!method initialize(canceled:, errored:, expired:, processing:, succeeded:)
          #   Some parameter documentations has been truncated, see
          #   {Sam::Models::Messages::BatchCreateResponse::RequestCounts} for more details.
          #
          #   Tallies requests within the Message Batch, categorized by their status.
          #
          #   Requests start as `processing` and move to one of the other statuses only once
          #   processing of the entire batch ends. The sum of all values always matches the
          #   total number of requests in the batch.
          #
          #   @param canceled [Integer] Number of requests in the Message Batch that have been canceled.
          #
          #   @param errored [Integer] Number of requests in the Message Batch that encountered an error.
          #
          #   @param expired [Integer] Number of requests in the Message Batch that have expired.
          #
          #   @param processing [Integer] Number of requests in the Message Batch that are processing.
          #
          #   @param succeeded [Integer] Number of requests in the Message Batch that have completed successfully.
        end
      end
    end
  end
end
