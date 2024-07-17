# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::ACHPrenotificationsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @increase.ach_prenotifications.create(
      {account_id: "account_in71c4amph0vgo2qllky", account_number: "987654321", routing_number: "101050001"}
    )
    assert_kind_of(SamRuby::Models::ACHPrenotification, response)
  end

  def test_retrieve
    response = @increase.ach_prenotifications.retrieve("ach_prenotification_id")
    assert_kind_of(SamRuby::Models::ACHPrenotification, response)
  end

  def test_list
    response = @increase.ach_prenotifications.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
