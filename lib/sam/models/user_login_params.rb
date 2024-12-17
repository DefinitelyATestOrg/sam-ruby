# frozen_string_literal: true

module Sam
  module Models
    class UserLoginParams < Sam::BaseModel
      # @!attribute password
      #   The password for login in clear text
      #
      #   @return [String]
      optional :password, String

      # @!attribute username
      #   The user name for login
      #
      #   @return [String]
      optional :username, String

      # @!parse
      #   # @param password [String, nil] The password for login in clear text
      #   #
      #   # @param username [String, nil] The user name for login
      #   #
      #   def initialize(password: nil, username: nil) = super

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
