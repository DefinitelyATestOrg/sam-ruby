# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::ExternalAccountsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @increase.external_accounts.create(
      {account_number: "987654321", description: "Landlord", routing_number: "101050001"}
    )
    assert_kind_of(SamRuby::Models::ExternalAccount, response)
  end

  def test_retrieve
    response = @increase.external_accounts.retrieve("external_account_id")
    assert_kind_of(SamRuby::Models::ExternalAccount, response)
  end

  def test_update
    response = @increase.external_accounts.update("external_account_id")
    assert_kind_of(SamRuby::Models::ExternalAccount, response)
  end

  def test_list
    response = @increase.external_accounts.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
