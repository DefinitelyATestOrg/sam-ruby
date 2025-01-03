# frozen_string_literal: true

module Sam
  class Error < StandardError
    # @!parse
    #   # @return [StandardError, nil]
    #   attr_reader :cause
  end

  class ConversionError < Sam::Error
  end

  class APIError < Sam::Error
    # @return [URI::Generic]
    attr_reader :url

    # @return [Integer, nil]
    attr_reader :status

    # @return [Object, nil]
    attr_reader :body

    def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
      @url = url
      @status = status
      @body = body
      @request = request
      @response = response
      super(message)
    end
  end

  class APIConnectionError < Sam::APIError
    # @!parse
    #   # @return [nil]
    #   attr_reader :status

    # @!parse
    #   # @return [nil]
    #   attr_reader :body

    def initialize(
      url:,
      status: nil,
      body: nil,
      request: nil,
      response: nil,
      message: "Connection error."
    )
      super
    end
  end

  class APITimeoutError < Sam::APIConnectionError
    def initialize(
      url:,
      status: nil,
      body: nil,
      request: nil,
      response: nil,
      message: "Request timed out."
    )
      super
    end
  end

  class APIStatusError < Sam::APIError
    # @private
    #
    # @param status [Integer]
    # @param body [Object, nil]
    # @param request [Object]
    # @param response [Object]
    #
    # @return [Sam::APIStatusError]
    def self.for(url:, status:, body:, request:, response:)
      kwargs = {url: url, status: status, body: body, request: request, response: response}

      case status
      in 400
        Sam::BadRequestError.new(**kwargs)
      in 401
        Sam::AuthenticationError.new(**kwargs)
      in 403
        Sam::PermissionDeniedError.new(**kwargs)
      in 404
        Sam::NotFoundError.new(**kwargs)
      in 409
        Sam::ConflictError.new(**kwargs)
      in 422
        Sam::UnprocessableEntityError.new(**kwargs)
      in 429
        Sam::RateLimitError.new(**kwargs)
      in (500..)
        Sam::InternalServerError.new(**kwargs)
      else
        Sam::APIStatusError.new(**kwargs)
      end
    end

    # @!parse
    #   # @return [Integer]
    #   attr_reader :status

    def initialize(url:, status:, body:, request:, response:, message: nil)
      message ||= {url: url.to_s, status: status, body: body}
      super(
        url: url,
        status: status,
        body: body,
        request: request,
        response: response,
        message: message&.to_s
      )
    end
  end

  class BadRequestError < Sam::APIStatusError
    HTTP_STATUS = 400
  end

  class AuthenticationError < Sam::APIStatusError
    HTTP_STATUS = 401
  end

  class PermissionDeniedError < Sam::APIStatusError
    HTTP_STATUS = 403
  end

  class NotFoundError < Sam::APIStatusError
    HTTP_STATUS = 404
  end

  class ConflictError < Sam::APIStatusError
    HTTP_STATUS = 409
  end

  class UnprocessableEntityError < Sam::APIStatusError
    HTTP_STATUS = 422
  end

  class RateLimitError < Sam::APIStatusError
    HTTP_STATUS = 429
  end

  class InternalServerError < Sam::APIStatusError
    HTTP_STATUS = (500..)
  end
end
