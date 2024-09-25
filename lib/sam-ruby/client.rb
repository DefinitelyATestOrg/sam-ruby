# frozen_string_literal: true

module SamRuby
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client options.
    attr_reader

    # @return [SamRuby::Resources::Pets]
    attr_reader :pets

    # @return [SamRuby::Resources::Stores]
    attr_reader :stores

    # @return [SamRuby::Resources::Users]
    attr_reader :users

    # Creates and returns a new client for interacting with the API.
    def initialize(base_url: nil, max_retries: nil)
      base_url ||= "/api/v3"

      max_retries ||= DEFAULT_MAX_RETRIES

      super

      @pets = SamRuby::Resources::Pets.new(client: self)
      @stores = SamRuby::Resources::Stores.new(client: self)
      @users = SamRuby::Resources::Users.new(client: self)
    end

    # @!visibility private
    def make_status_error(message:, body:, response:)
      case response.code.to_i
      when 400
        SamRuby::HTTP::BadRequestError.new(message: message, response: response, body: body)
      when 401
        SamRuby::HTTP::AuthenticationError.new(message: message, response: response, body: body)
      when 403
        SamRuby::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
      when 404
        SamRuby::HTTP::NotFoundError.new(message: message, response: response, body: body)
      when 409
        SamRuby::HTTP::ConflictError.new(message: message, response: response, body: body)
      when 422
        SamRuby::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
      when 429
        SamRuby::HTTP::RateLimitError.new(message: message, response: response, body: body)
      when 500..599
        SamRuby::HTTP::InternalServerError.new(message: message, response: response, body: body)
      else
        SamRuby::HTTP::APIStatusError.new(message: message, response: response, body: body)
      end
    end
  end
end
