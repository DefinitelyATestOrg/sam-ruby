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
      #   # @param id [Integer, nil]
      #   #
      #   # @param email [String, nil]
      #   #
      #   # @param first_name [String, nil]
      #   #
      #   # @param last_name [String, nil]
      #   #
      #   # @param password [String, nil]
      #   #
      #   # @param phone [String, nil]
      #   #
      #   # @param username [String, nil]
      #   #
      #   # @param user_status [Integer, nil] User Status
      #   #
      #   def initialize(
      #     id: nil,
      #     email: nil,
      #     first_name: nil,
      #     last_name: nil,
      #     password: nil,
      #     phone: nil,
      #     username: nil,
      #     user_status: nil
      #   )
      #     super
      #   end

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end