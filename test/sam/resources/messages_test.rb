# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::MessagesTest < Sam::Test::ResourceTest
  def test_create_required_params
    response =
      @sam.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: "claude-3-7-sonnet-20250219"
      )

    assert_pattern do
      response => Sam::Models::MessageCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        content: ^(Sam::Internal::Type::ArrayOf[union: Sam::Models::MessageCreateResponse::Content]),
        model: String,
        role: Symbol,
        stop_reason: Sam::Models::MessageCreateResponse::StopReason | nil,
        stop_sequence: String | nil,
        type: Symbol,
        usage: Sam::Models::MessageCreateResponse::Usage
      }
    end
  end

  def test_count_tokens_required_params
    response =
      @sam.messages.count_tokens(
        messages: [{content: "string", role: :user}],
        model: "claude-3-7-sonnet-20250219"
      )

    assert_pattern do
      response => Sam::Models::MessageCountTokensResponse
    end

    assert_pattern do
      response => {
        input_tokens: Integer
      }
    end
  end

  def test_count_tokens_beta_required_params
    response =
      @sam.messages.count_tokens_beta(
        messages: [{content: "string", role: :user}],
        model: "claude-3-7-sonnet-20250219"
      )

    assert_pattern do
      response => Sam::Models::MessageCountTokensBetaResponse
    end

    assert_pattern do
      response => {
        input_tokens: Integer
      }
    end
  end
end
