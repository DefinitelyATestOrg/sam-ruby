# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::StoresTest < Test::Unit::TestCase
  def setup
    @sam = SamRuby::Client.new(base_url: "http://localhost:4010")
  end

  def test_create_order
    response = @sam.stores.create_order 
    assert_kind_of(SamRuby::Models::Order, response)
  end

  def test_inventory
    response = @sam.stores.inventory 
    assert_kind_of(Hash, response)
  end
end
