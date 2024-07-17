# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::AccountStatementsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.account_statements.retrieve("account_statement_id")
    assert_kind_of(SamRuby::Models::AccountStatement, response)
  end

  def test_list
    response = @increase.account_statements.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
