# typed: strong

module Sam
  class Client < Sam::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # API key used for authenticating requests via the Authorization header
    sig { returns(String) }
    def api_key
    end

    sig { returns(Sam::Resources::Store) }
    def store
    end

    sig { returns(Sam::Resources::User) }
    def user
    end

    sig { returns(Sam::Resources::Messages) }
    def messages
    end

    sig { returns(Sam::Resources::Complete) }
    def complete
    end

    sig { returns(Sam::Resources::Models) }
    def models
    end

    sig { returns(Sam::Resources::MessagesBetaTrue) }
    def messages_beta_true
    end

    sig { returns(Sam::Resources::ModelsBetaTrue) }
    def models_beta_true
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        base_url: T.nilable(String),
        api_key: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      )
        .returns(T.attached_class)
    end
    def self.new(
      # Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
      base_url: nil,
      # API key used for authenticating requests via the Authorization header Defaults
      #   to `ENV["API_KEY"]`
      api_key: ENV["API_KEY"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
