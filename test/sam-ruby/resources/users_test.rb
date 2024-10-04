# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::UsersTest < Minitest::Test
  parallelize_me!

  def setup
    @sam = SamRuby::Client.new(base_url: "http://localhost:4010")
  end

  def test_create
    response = @sam.users.create
    assert_nil(response)
  end

  def test_retrieve
    response = @sam.users.retrieve("username")
    assert_kind_of(SamRuby::Models::User, response)
  end

  def test_update_required_params
    response = @sam.users.update({path_username: "username"})
    assert_nil(response)
  end

  def test_delete
    response = @sam.users.delete("username")
    assert_nil(response)
  end

  def test_create_with_list_required_params
    response = @sam.users.create_with_list({body: [{}, {}, {}]})
    assert_kind_of(SamRuby::Models::User, response)
  end

  def test_login
    response = @sam.users.login
    assert_kind_of(String, response)
  end

  def test_logout
    response = @sam.users.logout
    assert_nil(response)
  end
end
