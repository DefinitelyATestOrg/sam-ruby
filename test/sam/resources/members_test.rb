# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::MembersTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_update
    response = @sam.members.update("string")
    refute_nil(Object, response)
  end

  def test_delete
    response = @sam.members.delete("string")
    assert_nil(response)
  end
end
