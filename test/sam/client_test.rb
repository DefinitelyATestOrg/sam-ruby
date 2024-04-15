# frozen_string_literal: true

require_relative "test_helper"

class SamTest < Test::Unit::TestCase
  def test_raises_on_missing_non_nullable_opts
    assert_raise_with_message(ArgumentError, /is required/) do
      Sam::Client.new
    end
  end

  class MockResponse
    attr_accessor :code, :header, :body, :content_type

    def initialize(code)
      self.code = code
      self.header = {}
      self.body = "{}"
      self.content_type = "application/json"
    end
  end

  class MockRequester
    attr_accessor :response_code, :attempts

    def initialize(response_code)
      self.response_code = response_code
      self.attempts = []
    end

    def execute(req)
      attempts.push(req)
      MockResponse.new(response_code)
    end
  end

  def test_client_default_request_default_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
    requester = MockRequester.new(500)
    sam.requester = requester
    assert_raise(Sam::HTTP::InternalServerError) do
      sam.agents.retrieve("string")
    end
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token", max_retries: 3)
    requester = MockRequester.new(500)
    sam.requester = requester
    assert_raise(Sam::HTTP::InternalServerError) do
      sam.agents.retrieve("string")
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
    requester = MockRequester.new(500)
    sam.requester = requester
    assert_raise(Sam::HTTP::InternalServerError) do
      sam.agents.retrieve("string", max_retries: 3)
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token", max_retries: 3)
    requester = MockRequester.new(500)
    sam.requester = requester
    assert_raise(Sam::HTTP::InternalServerError) do
      sam.agents.retrieve("string", max_retries: 4)
    end
    assert_equal(5, requester.attempts.length)
  end

  def test_default_headers
    sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
    requester = MockRequester.new(200)
    sam.requester = requester
    sam.agents.retrieve("string")
    headers = requester.attempts[0][:headers]
    assert_not_empty(headers["X-Stainless-Lang"])
    assert_not_empty(headers["X-Stainless-Package-Version"])
    assert_not_empty(headers["X-Stainless-Runtime"])
    assert_not_empty(headers["X-Stainless-Runtime-Version"])
  end
end
