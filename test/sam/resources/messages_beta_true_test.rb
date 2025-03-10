# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::MessagesBetaTrueTest < Sam::Test::ResourceTest
  def test_create_required_params
    response = @sam.messages_beta_true.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: "claude-3-7-sonnet-20250219"
    )

    assert_pattern do
      response => Sam::Models::MessagesBetaTrueCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        content: ^(Sam::ArrayOf[union: Sam::Models::MessagesBetaTrueCreateResponse::Content]),
        model: String,
        role: Symbol,
        stop_reason: Sam::Models::MessagesBetaTrueCreateResponse::StopReason | nil,
        stop_sequence: String | nil,
        type: Symbol,
        usage: Sam::Models::MessagesBetaTrueCreateResponse::Usage
      }
    end
  end
end
