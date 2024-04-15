# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::AgentsTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_retrieve
    response = @sam.agents.retrieve("string")
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end

  def test_update_required_params
    response = @sam.agents.update("string", {agent: {}})
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end

  def test_delete
    response = @sam.agents.delete("string")
    assert(Sam::Converter.same_type?(NilClass, response), response.class.to_s)
  end
end
