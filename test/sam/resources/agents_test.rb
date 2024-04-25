# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::AgentsTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_retrieve
    response = @sam.agents.retrieve("string")
    refute_nil(Object, response)
  end

  def test_update_required_params
    response = @sam.agents.update("string", {agent: {}})
    refute_nil(Object, response)
  end

  def test_delete
    response = @sam.agents.delete("string")
    assert_nil(response)
  end
end
