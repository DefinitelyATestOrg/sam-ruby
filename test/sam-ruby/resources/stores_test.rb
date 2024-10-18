# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::StoresTest < Minitest::Test
  parallelize_me!

  def setup
    @sam = SamRuby::Client.new(base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"))
  end

  def test_retrieve
    response = @sam.stores.retrieve(0)
    assert_kind_of(SamRuby::Models::Order, response)
  end

  def test_delete
    response = @sam.stores.delete(0)
    assert_nil(response)
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
