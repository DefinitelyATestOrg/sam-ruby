# frozen_string_literal: true

require_relative "test_helper"

class SamTest < Minitest::Test
  def test_raises_on_missing_non_nullable_opts
    e = assert_raises(ArgumentError) do
      Sam::Client.new
    end
    assert_match(/is required/, e.message)
  end

  class MockResponse
    # @return [Integer]
    attr_accessor :code

    # @return [String]
    attr_accessor :body

    # @return [String]
    attr_accessor :content_type

    # @param code [Integer]
    # @param data [Object]
    # @param headers [Hash{String => String}]
    def initialize(code, data, headers)
      @headers = headers
      @code = code
      @body = JSON.generate(data)
      @content_type = "application/json"
    end

    def [](header)
      @headers[header]
    end

    def key?(header)
      @headers.key?(header)
    end
  end

  class MockRequester
    # @return [Integer]
    attr_accessor :response_code

    # @return [Object]
    attr_accessor :response_data

    # @return [Hash{String => String}]
    attr_accessor :response_headers

    # @return [Array<Hash{Symbol => Object}>]
    attr_accessor :attempts

    # @param response_code [Integer]
    # @param response_data [Object]
    # @param response_headers [Hash{String => String}]
    def initialize(response_code, response_data, response_headers)
      @response_code = response_code
      @response_data = response_data
      @response_headers = response_headers
      @attempts = []
    end

    # @param req [Hash{Symbol => Object}]
    # @param timeout [Float, nil]
    def execute(req, timeout:)
      # Deep copy the request because it is mutated on each retry.
      attempts.push(Marshal.load(Marshal.dump(req)))
      MockResponse.new(response_code, response_data, response_headers)
    end
  end

  def test_client_default_request_default_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create
    end

    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create
    end

    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create(max_retries: 3)
    end

    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create(max_retries: 4)
    end

    assert_equal(5, requester.attempts.length)
  end

  def test_client_retry_after_seconds
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after" => "1.3", "x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create
    end

    assert_equal(2, requester.attempts.length)
    assert_equal(1.3, requester.attempts.last[:headers]["x-stainless-mock-slept"])
  end

  def test_client_retry_after_date
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(
      500,
      {},
      {
        "retry-after" => (Time.now + 10).httpdate,
        "x-stainless-mock-sleep" => "true"
      }
    )
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      Time.stub(:now, Time.now) do
        sam.users.create
      end
    end

    assert_equal(2, requester.attempts.length)
    assert_in_delta(10, requester.attempts.last[:headers]["x-stainless-mock-slept"], 1.0)
  end

  def test_client_retry_after_ms
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after-ms" => "1300", "x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create
    end

    assert_equal(2, requester.attempts.length)
    assert_equal(1.3, requester.attempts.last[:headers]["x-stainless-mock-slept"])
  end

  def test_retry_count_header
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["x-stainless-retry-count"] }
    assert_equal(%w[0 1 2], retry_count_headers)
  end

  def test_omit_retry_count_header
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create(extra_headers: {"x-stainless-retry-count" => nil})
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["x-stainless-retry-count"] }
    assert_equal([nil, nil, nil], retry_count_headers)
  end

  def test_overwrite_retry_count_header
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester

    assert_raises(Sam::InternalServerError) do
      sam.users.create(extra_headers: {"x-stainless-retry-count" => "42"})
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["x-stainless-retry-count"] }
    assert_equal(%w[42 42 42], retry_count_headers)
  end

  def test_client_redirect_307
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    sam.requester = requester

    assert_raises(Sam::APIConnectionError) do
      sam.users.create(extra_headers: {})
    end

    assert_equal("/redirected", requester.attempts[1][:url].path)
    assert_equal(requester.attempts[0][:method], requester.attempts[1][:method])
    assert_equal(requester.attempts[0][:body], requester.attempts[1][:body])
    assert_equal(
      requester.attempts[0][:headers]["content-type"],
      requester.attempts[1][:headers]["content-type"]
    )
  end

  def test_client_redirect_303
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(303, {}, {"location" => "/redirected"})
    sam.requester = requester

    assert_raises(Sam::APIConnectionError) do
      sam.users.create(extra_headers: {})
    end

    assert_equal("/redirected", requester.attempts[1][:url].path)
    assert_equal(:get, requester.attempts[1][:method])
    assert_nil(requester.attempts[1][:body])
    assert_nil(requester.attempts[1][:headers]["Content-Type"])
  end

  def test_client_redirect_auth_keep_same_origin
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    sam.requester = requester

    assert_raises(Sam::APIConnectionError) do
      sam.users.create(extra_headers: {"Authorization" => "Bearer xyz"})
    end

    assert_equal(
      requester.attempts[0][:headers]["authorization"],
      requester.attempts[1][:headers]["authorization"]
    )
  end

  def test_client_redirect_auth_strip_cross_origin
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "https://example.com/redirected"})
    sam.requester = requester

    assert_raises(Sam::APIConnectionError) do
      sam.users.create(extra_headers: {"Authorization" => "Bearer xyz"})
    end

    assert_nil(requester.attempts[1][:headers]["Authorization"])
  end

  def test_default_headers
    sam = Sam::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(200, {}, {"x-stainless-mock-sleep" => "true"})
    sam.requester = requester
    sam.users.create
    headers = requester.attempts[0][:headers]

    refute_empty(headers["x-stainless-lang"])
    refute_empty(headers["x-stainless-package-version"])
    refute_empty(headers["x-stainless-runtime"])
    refute_empty(headers["x-stainless-runtime-version"])
  end
end