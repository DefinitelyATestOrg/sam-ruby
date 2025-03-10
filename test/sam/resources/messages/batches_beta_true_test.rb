# frozen_string_literal: true

require_relative "../../test_helper"

class Sam::Test::Resources::Messages::BatchesBetaTrueTest < Sam::Test::ResourceTest
  def test_create_required_params
    response = @sam.messages.batches_beta_true.create(
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
      response => Sam::Models::Messages::BatchesBetaTrueCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Sam::Models::Messages::BatchesBetaTrueCreateResponse::ProcessingStatus,
        request_counts: Sam::Models::Messages::BatchesBetaTrueCreateResponse::RequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @sam.messages.batches_beta_true.list

    assert_pattern do
      response => Sam::Models::Messages::BatchesBetaTrueListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sam::ArrayOf[Sam::Models::Messages::BatchesBetaTrueListResponse::Data]),
        first_id: String | nil,
        has_more: Sam::BooleanModel,
        last_id: String | nil
      }
    end
  end
end
