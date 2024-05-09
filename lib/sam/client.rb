# frozen_string_literal: true

module Sam
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client options.
    attr_reader :auth_token

    # @return [Sam::Resources::ReferenceSets]
    attr_reader :reference_sets

    # @return [Sam::Resources::ReferenceSessions]
    attr_reader :reference_sessions

    # @return [Sam::Resources::Organizations]
    attr_reader :organizations

    # @return [Sam::Resources::Members]
    attr_reader :members

    # @return [Sam::Resources::Feedbacks]
    attr_reader :feedbacks

    # @return [Sam::Resources::Documents]
    attr_reader :documents

    # @return [Sam::Resources::Corpora]
    attr_reader :corpora

    # @return [Sam::Resources::Agents]
    attr_reader :agents

    # @return [Sam::Resources::ActionSets]
    attr_reader :action_sets

    # @return [Sam::Resources::Actions]
    attr_reader :actions

    # @!visibility private
    def auth_headers
      {"Authorization" => "Bearer #{@auth_token}"}
    end

    # Creates and returns a new client for interacting with the API.
    def initialize(base_url: nil, auth_token: nil, max_retries: nil)
      base_url ||= "http://localhost:8085/"

      max_retries ||= DEFAULT_MAX_RETRIES

      @auth_token = [auth_token, ENV["MAVENAGI_AUTH_TOKEN"]].find { |v| !v.nil? }

      super(base_url: base_url, max_retries: max_retries)

      @reference_sets = Sam::Resources::ReferenceSets.new(client: self)
      @reference_sessions = Sam::Resources::ReferenceSessions.new(client: self)
      @organizations = Sam::Resources::Organizations.new(client: self)
      @members = Sam::Resources::Members.new(client: self)
      @feedbacks = Sam::Resources::Feedbacks.new(client: self)
      @documents = Sam::Resources::Documents.new(client: self)
      @corpora = Sam::Resources::Corpora.new(client: self)
      @agents = Sam::Resources::Agents.new(client: self)
      @action_sets = Sam::Resources::ActionSets.new(client: self)
      @actions = Sam::Resources::Actions.new(client: self)
    end

    # @!visibility private
    def make_status_error(message:, body:, response:)
      case response.code.to_i
      when 400
        Sam::HTTP::BadRequestError.new(message: message, response: response, body: body)
      when 401
        Sam::HTTP::AuthenticationError.new(message: message, response: response, body: body)
      when 403
        Sam::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
      when 404
        Sam::HTTP::NotFoundError.new(message: message, response: response, body: body)
      when 409
        Sam::HTTP::ConflictError.new(message: message, response: response, body: body)
      when 422
        Sam::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
      when 429
        Sam::HTTP::RateLimitError.new(message: message, response: response, body: body)
      when 500..599
        Sam::HTTP::InternalServerError.new(message: message, response: response, body: body)
      else
        Sam::HTTP::APIStatusError.new(message: message, response: response, body: body)
      end
    end
  end
end
