# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::GroupsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve_details
    response = @increase.groups.retrieve_details 
    assert_kind_of(SamRuby::Models::Group, response)
  end
end