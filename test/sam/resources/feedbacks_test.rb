# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::FeedbacksTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_update_required_params
    response = @sam.feedbacks.update("string", {agentId: "string", ticketMessageId: "string"})
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end
end
