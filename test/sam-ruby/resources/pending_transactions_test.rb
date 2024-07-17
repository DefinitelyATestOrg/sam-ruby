# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::PendingTransactionsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.pending_transactions.retrieve("pending_transaction_id")
    assert_kind_of(SamRuby::Models::PendingTransaction, response)
  end

  def test_list
    response = @increase.pending_transactions.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
