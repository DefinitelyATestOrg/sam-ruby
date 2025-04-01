# frozen_string_literal: true

module Sam
  class Client < Sam::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # API key used for authenticating requests via the Authorization header
    # @return [String]
    attr_reader :api_key

    # @return [Sam::Resources::Store]
    attr_reader :store

    # @return [Sam::Resources::User]
    attr_reader :user

    # @return [Sam::Resources::Messages]
    attr_reader :messages

    # @return [Sam::Resources::Complete]
    attr_reader :complete

    # @return [Sam::Resources::Models]
    attr_reader :models

    # @return [Sam::Resources::MessagesBetaTrue]
    attr_reader :messages_beta_true

    # @return [Sam::Resources::ModelsBetaTrue]
    attr_reader :models_beta_true

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] API key used for authenticating requests via the Authorization header Defaults
    #   to `ENV["API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["API_KEY"],
      base_url: nil,
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "/api/v3"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"API_KEY\"")
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
      @user = Sam::Resources::User.new(client: self)
      @messages = Sam::Resources::Messages.new(client: self)
      @complete = Sam::Resources::Complete.new(client: self)
      @models = Sam::Resources::Models.new(client: self)
      @messages_beta_true = Sam::Resources::MessagesBetaTrue.new(client: self)
      @models_beta_true = Sam::Resources::ModelsBetaTrue.new(client: self)
    end
  end
end
