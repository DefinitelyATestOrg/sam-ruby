# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::DocumentsTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_retrieve
    response = @sam.documents.retrieve("string")
    refute_nil(Object, response)
  end

  def test_update
    response = @sam.documents.update("string")
    refute_nil(Object, response)
  end

  def test_delete
    response = @sam.documents.delete("string")
    assert_nil(response)
  end
end
