# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::InboundACHTransfersTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.inbound_ach_transfers.retrieve("inbound_ach_transfer_id")
    assert_kind_of(SamRuby::Models::InboundACHTransfer, response)
  end

  def test_list
    response = @increase.inbound_ach_transfers.list 
    assert_kind_of(SamRuby::Page, response)
  end

  def test_decline
    response = @increase.inbound_ach_transfers.decline("inbound_ach_transfer_id")
    assert_kind_of(SamRuby::Models::InboundACHTransfer, response)
  end

  def test_notification_of_change
    response = @increase.inbound_ach_transfers.notification_of_change("inbound_ach_transfer_id")
    assert_kind_of(SamRuby::Models::InboundACHTransfer, response)
  end

  def test_transfer_return_required_params
    response = @increase.inbound_ach_transfers.transfer_return("inbound_ach_transfer_id", {reason: "payment_stopped"})
    assert_kind_of(SamRuby::Models::InboundACHTransfer, response)
  end
end