# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::EventsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.events.retrieve("event_id")
    assert_kind_of(SamRuby::Models::Event, response)
  end

  def test_list
    response = @increase.events.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
