# frozen_string_literal: true

module Sam
  module Models
    class UserLoginParams < Sam::BaseModel
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
      #   #
      #   def initialize(password: nil, username: nil, **) = super

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
