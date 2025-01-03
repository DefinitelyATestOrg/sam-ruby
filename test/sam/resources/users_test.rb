# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::UsersTest < Minitest::Test
  def before_all
    @sam = Sam::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create
    response = @sam.users.create

    assert_pattern do
      response => Sam::Models::User
    end
  end

  def test_retrieve
    response = @sam.users.retrieve("username")

    assert_pattern do
      response => Sam::Models::User
    end
  end

  def test_update_required_params
    response = @sam.users.update(path_username: "username")

    assert_pattern do
      response => nil
    end
  end

  def test_delete
    response = @sam.users.delete("username")

    assert_pattern do
      response => nil
    end
  end

  def test_create_with_list_required_params
    response = @sam.users.create_with_list(body: [{}])

    assert_pattern do
      response => Sam::Models::User
    end
  end

  def test_login
    response = @sam.users.login

    assert_pattern do
      response => String
    end
  end

  def test_logout
    response = @sam.users.logout

    assert_pattern do
      response => nil
    end
  end
end
