# frozen_string_literal: true

require_relative "../../test_helper"

class Sam::Test::Resources::Store::OrdersTest < Minitest::Test
  def before_all
    @sam = Sam::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_retrieve
    response = @sam.store.orders.retrieve(0)

    assert_pattern do
      response => Sam::Models::Order
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        complete: Sam::BooleanModel | nil,
        pet_id: Integer | nil,
        quantity: Integer | nil,
        ship_date: Time | nil,
        status: Sam::Models::Order::Status | nil
      }
    end
  end

  def test_delete
    response = @sam.store.orders.delete(0)

    assert_pattern do
      response => nil
    end
  end
end
