# frozen_string_literal: true

module Sam
  module Models
    class UserLoginParams < Sam::BaseModel
      # @!parse
      #   extend Sam::RequestParameters::Converter
      include Sam::RequestParameters

      # @!attribute [r] password
      #   The password for login in clear text
      #
      #   @return [String, nil]
      optional :password, String

      # @!parse
      #   # @return [String]
      #   attr_writer :password

      # @!attribute [r] username
      #   The user name for login
      #
      #   @return [String, nil]
      optional :username, String

      # @!parse
      #   # @return [String]
      #   attr_writer :username

      # @!parse
      #   # @param password [String]
      #   # @param username [String]
      #   # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(password: nil, username: nil, request_options: {}, **) = super

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
