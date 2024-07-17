# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::AccountTransfersTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @increase.account_transfers.create(
      {account_id: "account_in71c4amph0vgo2qllky", amount: 100, description: "Creating liquidity", destination_account_id: "account_uf16sut2ct5bevmq3eh"}
    )
    assert_kind_of(SamRuby::Models::AccountTransfer, response)
  end

  def test_retrieve
    response = @increase.account_transfers.retrieve("account_transfer_id")
    assert_kind_of(SamRuby::Models::AccountTransfer, response)
  end

  def test_list
    response = @increase.account_transfers.list 
    assert_kind_of(SamRuby::Page, response)
  end

  def test_approve
    response = @increase.account_transfers.approve("account_transfer_id")
    assert_kind_of(SamRuby::Models::AccountTransfer, response)
  end

  def test_cancel
    response = @increase.account_transfers.cancel("account_transfer_id")
    assert_kind_of(SamRuby::Models::AccountTransfer, response)
  end
end
