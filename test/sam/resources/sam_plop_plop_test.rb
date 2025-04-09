# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::SamPlopPlopTest < Sam::Test::ResourceTest
  def test_create_message_required_params
    response =
      @sam.sam_plop_plop.create_message(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: "claude-3-7-sonnet-20250219"
      )

    assert_pattern do
      response => Sam::Models::SamPlopPlopCreateMessageResponse
    end

    assert_pattern do
      response => {
        id: String,
        content: ^(Sam::Internal::Type::ArrayOf[union: Sam::Models::SamPlopPlopCreateMessageResponse::Content]),
        model: String,
        role: Symbol,
        stop_reason: Sam::Models::SamPlopPlopCreateMessageResponse::StopReason | nil,
        stop_sequence: String | nil,
        type: Symbol,
        usage: Sam::Models::SamPlopPlopCreateMessageResponse::Usage
      }
    end
  end
end
