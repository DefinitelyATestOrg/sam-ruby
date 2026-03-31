# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::CompleteTest < Sam::Test::ResourceTest
  def test_create_required_params
    response =
      @sam.complete.create(
        max_tokens_to_sample: 256,
        model: "claude-2.1",
        prompt: "\n\nHuman: Hello, world!\n\nAssistant:"
      )

    assert_pattern do
      response => Sam::Models::CompleteCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        completion: String,
        model: String,
        stop_reason: String | nil,
        type: Symbol
      }
    end
  end
end
