# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::DocumentsTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_retrieve
    response = @sam.documents.retrieve("string")
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end

  def test_update
    response = @sam.documents.update("string")
    assert(Sam::Converter.same_type?(Sam::Unknown, response), response.class.to_s)
  end

  def test_delete
    response = @sam.documents.delete("string")
    assert(Sam::Converter.same_type?(NilClass, response), response.class.to_s)
  end
end
