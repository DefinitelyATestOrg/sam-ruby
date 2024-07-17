# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::ProofOfAuthorizationRequestsTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @increase.proof_of_authorization_requests.retrieve("proof_of_authorization_request_id")
    assert_kind_of(SamRuby::Models::ProofOfAuthorizationRequest, response)
  end

  def test_list
    response = @increase.proof_of_authorization_requests.list 
    assert_kind_of(SamRuby::Page, response)
  end
end
