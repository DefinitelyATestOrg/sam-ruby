# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::UserTest < Minitest::Test
  def before_all
    @sam = Sam::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create
    response = @sam.user.create

    assert_pattern do
      response => Sam::Models::UserAPI
    end
  end

  def test_retrieve
    response = @sam.user.retrieve("username")

    assert_pattern do
      response => Sam::Models::UserAPI
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

  def test_create_list_required_params
    response = @sam.user.create_list(body: [{}])

    assert_pattern do
      response => Sam::Models::UserAPI
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
