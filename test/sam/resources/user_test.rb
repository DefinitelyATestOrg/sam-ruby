# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::UserTest < Sam::Test::ResourceTest
  def test_create
    response = @sam.user.create

    assert_pattern do
      response => Sam::Models::UserAPI
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        password: String | nil,
        phone: String | nil,
        username: String | nil,
        user_status: Integer | nil
      }
    end
  end

  def test_retrieve
    response = @sam.user.retrieve("username")

    assert_pattern do
      response => Sam::Models::UserAPI
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        password: String | nil,
        phone: String | nil,
        username: String | nil,
        user_status: Integer | nil
      }
    end
  end

  def test_update
    response = @sam.user.update("username")

    assert_pattern do
      response => nil
    end
  end

  def test_delete
    response = @sam.user.delete("username")

    assert_pattern do
      response => nil
    end
  end

  def test_create_list
    response = @sam.user.create_list

    assert_pattern do
      response => Sam::Models::UserAPI
    end

    assert_pattern do
      response => {
        id: Integer | nil,
        email: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        password: String | nil,
        phone: String | nil,
        username: String | nil,
        user_status: Integer | nil
      }
    end
  end

  def test_login
    response = @sam.user.login

    assert_pattern do
      response => String
    end
  end

  def test_logout
    response = @sam.user.logout

    assert_pattern do
      response => nil
    end
  end
end
