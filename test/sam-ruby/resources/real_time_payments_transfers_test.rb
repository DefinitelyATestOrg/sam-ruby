# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::RealTimePaymentsTransfersTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @increase.real_time_payments_transfers.create(
      {amount: 100, creditor_name: "Ian Crease", remittance_information: "Invoice 29582", source_account_number_id: "account_number_v18nkfqm6afpsrvy82b2"}
    )
    assert_kind_of(SamRuby::Models::RealTimePaymentsTransfer, response)
  end

  def test_retrieve
    response = @increase.real_time_payments_transfers.retrieve("real_time_payments_transfer_id")
    assert_kind_of(SamRuby::Models::RealTimePaymentsTransfer, response)
  end

  def test_list
    response = @increase.real_time_payments_transfers.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
