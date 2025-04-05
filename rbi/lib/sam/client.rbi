# typed: strong

module Sam
  class Client < Sam::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # API key used for authenticating requests via the Authorization header
    sig { returns(String) }
    attr_reader :api_key

    sig { returns(Sam::Resources::Store) }
    attr_reader :store

    sig { returns(Sam::Resources::User) }
    attr_reader :user

    sig { returns(Sam::Resources::Messages) }
    attr_reader :messages

    sig { returns(Sam::Resources::Complete) }
    attr_reader :complete

    sig { returns(Sam::Resources::Models) }
    attr_reader :models

    sig { returns(Sam::Resources::MessagesBetaTrue) }
    attr_reader :messages_beta_true

    sig { returns(Sam::Resources::ModelsBetaTrue) }
    attr_reader :models_beta_true

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      )
        .returns(T.attached_class)
    end
    def self.new(
      # API key used for authenticating requests via the Authorization header Defaults
      # to `ENV["API_KEY"]`
      api_key: ENV["API_KEY"],
      # Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
      base_url: nil,
      # Max number of retries to attempt after a failed retryable request.
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    ); end
  end
end
