# frozen_string_literal: true

require_relative "../../test_helper"

class Sam::Test::Resources::Store::OrdersTest < Sam::Test::ResourceTest
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
