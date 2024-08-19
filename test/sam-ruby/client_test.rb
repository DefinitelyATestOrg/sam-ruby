# frozen_string_literal: true

require_relative "test_helper"

class SamRubyTest < Test::Unit::TestCase
  class MockResponse
    attr_accessor :code, :header, :body, :content_type

    def initialize(code, data)
      self.code = code
      self.header = {}
      self.body = JSON.generate(data)
      self.content_type = "application/json"
    end
  end

  class MockRequester
    attr_accessor :response_code, :response_data, :attempts

    def initialize(response_code, response_data)
      self.response_code = response_code
      self.response_data = response_data
      self.attempts = []
    end

    def execute(req)
      attempts.push(req)
      MockResponse.new(response_code, response_data)
    end
  end

  def test_client_default_request_default_retry_attempts
    sam = SamRuby::Client.new(base_url: "http://localhost:4010")
    requester = MockRequester.new(500, {})
    sam.requester = requester
    assert_raise(SamRuby::HTTP::InternalServerError) do
      sam.stores.create_order 
    end
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    sam = SamRuby::Client.new(base_url: "http://localhost:4010", max_retries: 3)
    requester = MockRequester.new(500, {})
    sam.requester = requester
    assert_raise(SamRuby::HTTP::InternalServerError) do
      sam.stores.create_order 
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    sam = SamRuby::Client.new(base_url: "http://localhost:4010")
    requester = MockRequester.new(500, {})
    sam.requester = requester
    assert_raise(SamRuby::HTTP::InternalServerError) do
      sam.stores.create_order(max_retries: 3)
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    sam = SamRuby::Client.new(base_url: "http://localhost:4010", max_retries: 3)
    requester = MockRequester.new(500, {})
    sam.requester = requester
    assert_raise(SamRuby::HTTP::InternalServerError) do
      sam.stores.create_order(max_retries: 4)
    end
    assert_equal(5, requester.attempts.length)
  end

  def test_default_headers
    sam = SamRuby::Client.new(base_url: "http://localhost:4010")
    requester = MockRequester.new(200, {})
    sam.requester = requester
    sam.stores.create_order
    headers = requester.attempts[0][:headers]
    assert_not_empty(headers["X-Stainless-Lang"])
    assert_not_empty(headers["X-Stainless-Package-Version"])
    assert_not_empty(headers["X-Stainless-Runtime"])
    assert_not_empty(headers["X-Stainless-Runtime-Version"])
  end
end
