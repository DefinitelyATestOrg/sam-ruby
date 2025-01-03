# frozen_string_literal: true

module Sam
  module Models
    class User < Sam::BaseModel
      # @!attribute id
      #
      #   @return [Integer]
      optional :id, Integer

      # @!attribute email
      #
      #   @return [String]
      optional :email, String

      # @!attribute first_name
      #
      #   @return [String]
      optional :first_name, String, api_name: :firstName

      # @!attribute last_name
      #
      #   @return [String]
      optional :last_name, String, api_name: :lastName

      # @!attribute password
      #
      #   @return [String]
      optional :password, String

      # @!attribute phone
      #
      #   @return [String]
      optional :phone, String

      # @!attribute username
      #
      #   @return [String]
      optional :username, String

      # @!attribute user_status
      #   User Status
      #
      #   @return [Integer]
      optional :user_status, Integer, api_name: :userStatus

      # @!parse
      #   # @param id [Integer]
      #   #
      #   # @param email [String]
      #   #
      #   # @param first_name [String]
      #   #
      #   # @param last_name [String]
      #   #
      #   # @param password [String]
      #   #
      #   # @param phone [String]
      #   #
      #   # @param username [String]
      #   #
      #   # @param user_status [Integer] User Status
      #   #
      #   def initialize(
      #     id: nil,
      #     email: nil,
      #     first_name: nil,
      #     last_name: nil,
      #     password: nil,
      #     phone: nil,
      #     username: nil,
      #     user_status: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
