# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::RoutingNumbersTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_list_required_params
    response = @increase.routing_numbers.list({routing_number: "xxxxxxxxx"})
    assert_kind_of(SamRuby::Page, response)
  end
end
