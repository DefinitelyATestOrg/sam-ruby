# frozen_string_literal: true

require_relative "../../test_helper"

class Sam::Test::Resources::Store::OrdersTest < Minitest::Test
  def setup
    @sam = Sam::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_retrieve
    response = @sam.store.orders.retrieve(0)

    assert_pattern do
      response => Sam::Models::Store::CoolOrder
    end
  end

  def test_delete
    response = @sam.store.orders.delete(0)

    assert_pattern do
      response => nil
    end
  end
end
