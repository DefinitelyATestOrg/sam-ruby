# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::FilesTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.files.retrieve("file_id")
    assert_kind_of(SamRuby::Models::File, response)
  end

  def test_list
    response = @increase.files.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
