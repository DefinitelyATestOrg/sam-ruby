# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::PhysicalCardsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @increase.physical_cards.create(
      {card_id: "card_oubs0hwk5rn6knuecxg2", cardholder: {"first_name" => "Ian", "last_name" => "Crease"}, shipment: {"address" => {"city" => "New York", "line1" => "33 Liberty Street", "name" => "Ian Crease", "postal_code" => "10045", "state" => "NY"}, "method" => "usps"}}
    )
    assert_kind_of(SamRuby::Models::PhysicalCard, response)
  end

  def test_retrieve
    response = @increase.physical_cards.retrieve("physical_card_id")
    assert_kind_of(SamRuby::Models::PhysicalCard, response)
  end

  def test_update_required_params
    response = @increase.physical_cards.update("physical_card_id", {status: "disabled"})
    assert_kind_of(SamRuby::Models::PhysicalCard, response)
  end

  def test_list
    response = @increase.physical_cards.list 
    assert_kind_of(SamRuby::Page, response)
  end
end