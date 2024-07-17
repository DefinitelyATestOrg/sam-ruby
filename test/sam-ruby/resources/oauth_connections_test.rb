# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::OAuthConnectionsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.oauth_connections.retrieve("oauth_connection_id")
    assert_kind_of(SamRuby::Models::OAuthConnection, response)
  end

  def test_list
    response = @increase.oauth_connections.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
