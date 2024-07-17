# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::DocumentsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.documents.retrieve("document_id")
    assert_kind_of(SamRuby::Models::Document, response)
  end

  def test_list
    response = @increase.documents.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
