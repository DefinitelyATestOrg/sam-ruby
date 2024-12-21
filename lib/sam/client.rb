# frozen_string_literal: true

module Sam
  class Client < Sam::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Client option
    # @return [String]
    attr_reader :api_key

    # @return [Sam::Resources::Store]
    attr_reader :store

    # @return [Sam::Resources::Users]
    attr_reader :users

    # @private
    private def auth_headers
      {"api_key" => @api_key}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
    #
    # @param api_key [String, nil] API key used for authenticating requests via the Authorization header Defaults
    #   to `ENV["API_KEY"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    def initialize(
      base_url: nil,
      api_key: ENV["API_KEY"],
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "/api/v3"

      if api_key.nil?
        raise ArgumentError.new("api_key is required")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @store = Sam::Resources::Store.new(client: self)
      @users = Sam::Resources::Users.new(client: self)
    end
  end
end
