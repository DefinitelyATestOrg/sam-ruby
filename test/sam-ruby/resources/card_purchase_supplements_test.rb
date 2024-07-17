# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::CardPurchaseSupplementsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.card_purchase_supplements.retrieve("card_purchase_supplement_id")
    assert_kind_of(SamRuby::Models::CardPurchaseSupplement, response)
  end

  def test_list
    response = @increase.card_purchase_supplements.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
