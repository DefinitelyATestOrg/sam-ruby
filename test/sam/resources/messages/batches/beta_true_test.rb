# frozen_string_literal: true

require_relative "../../../test_helper"

class Sam::Test::Resources::Messages::Batches::BetaTrueTest < Sam::Test::ResourceTest
  def test_retrieve
    response = @sam.messages.batches.beta_true.retrieve("message_batch_id")

    assert_pattern do
      response => Sam::Models::Messages::Batches::BetaTrueRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Sam::Models::Messages::Batches::BetaTrueRetrieveResponse::ProcessingStatus,
        request_counts: Sam::Models::Messages::Batches::BetaTrueRetrieveResponse::RequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_delete
    response = @sam.messages.batches.beta_true.delete("message_batch_id")

    assert_pattern do
      response => Sam::Models::Messages::Batches::BetaTrueDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end
end
