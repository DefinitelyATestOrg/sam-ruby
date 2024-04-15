# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::ActionSetsTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_retrieve
    response = @sam.action_sets.retrieve("string")
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end

  def test_update_required_params
    response = @sam.action_sets.update({path_id: "string", name: "string"})
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end

  def test_delete
    response = @sam.action_sets.delete("string")
    assert(Sam::Converter.same_type?(NilClass, response), response.class.to_s)
  end
end
