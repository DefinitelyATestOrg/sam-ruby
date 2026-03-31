# frozen_string_literal: true

require_relative "../../test_helper"

class Sam::Test::Resources::Messages::BatchesTest < Sam::Test::ResourceTest
  def test_create_required_params
    response =
      @sam.messages.batches.create(
        requests: [
          {
            custom_id: "my-custom-id-1",
            params: {
              max_tokens: 1024,
              messages: [{content: "Hello, world", role: :user}],
              model: "claude-3-7-sonnet-20250219"
            }
          }
        ]
      )

    assert_pattern do
      response => Sam::Models::Messages::BatchCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Sam::Models::Messages::BatchCreateResponse::ProcessingStatus,
        request_counts: Sam::Models::Messages::BatchCreateResponse::RequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @sam.messages.batches.retrieve("message_batch_id")

    assert_pattern do
      response => Sam::Models::Messages::BatchRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Sam::Models::Messages::BatchRetrieveResponse::ProcessingStatus,
        request_counts: Sam::Models::Messages::BatchRetrieveResponse::RequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @sam.messages.batches.list

    assert_pattern do
      response => Sam::Models::Messages::BatchListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sam::Internal::Type::ArrayOf[Sam::Models::Messages::BatchListResponse::Data]),
        first_id: String | nil,
        has_more: Sam::Internal::Type::Boolean,
        last_id: String | nil
      }
    end
  end

  def test_delete
    response = @sam.messages.batches.delete("message_batch_id")

    assert_pattern do
      response => Sam::Models::Messages::BatchDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_cancel
    response = @sam.messages.batches.cancel("message_batch_id")

    assert_pattern do
      response => Sam::Models::Messages::BatchCancelResponse
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Sam::Models::Messages::BatchCancelResponse::ProcessingStatus,
        request_counts: Sam::Models::Messages::BatchCancelResponse::RequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_cancel_beta
    response = @sam.messages.batches.cancel_beta("message_batch_id")

    assert_pattern do
      response => Sam::Models::Messages::BatchCancelBetaResponse
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Sam::Models::Messages::BatchCancelBetaResponse::ProcessingStatus,
        request_counts: Sam::Models::Messages::BatchCancelBetaResponse::RequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end
end
