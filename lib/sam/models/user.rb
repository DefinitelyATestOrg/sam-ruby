# frozen_string_literal: true

module Sam
  module Models
    class UserAPI < Sam::BaseModel
      # @!attribute [r] id
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :id

      # @!attribute [r] email
      #
      #   @return [String, nil]
      optional :email, String

      # @!parse
      #   # @return [String]
      #   attr_writer :email

      # @!attribute [r] first_name
      #
      #   @return [String, nil]
      optional :first_name, String, api_name: :firstName

      # @!parse
      #   # @return [String]
      #   attr_writer :first_name

      # @!attribute [r] last_name
      #
      #   @return [String, nil]
      optional :last_name, String, api_name: :lastName

      # @!parse
      #   # @return [String]
      #   attr_writer :last_name

      # @!attribute [r] password
      #
      #   @return [String, nil]
      optional :password, String

      # @!parse
      #   # @return [String]
      #   attr_writer :password

      # @!attribute [r] phone
      #
      #   @return [String, nil]
      optional :phone, String

      # @!parse
      #   # @return [String]
      #   attr_writer :phone

      # @!attribute [r] username
      #
      #   @return [String, nil]
      optional :username, String

      # @!parse
      #   # @return [String]
      #   attr_writer :username

      # @!attribute [r] user_status
      #   User Status
      #
      #   @return [Integer, nil]
      optional :user_status, Integer, api_name: :userStatus

      # @!parse
      #   # @return [Integer]
      #   attr_writer :user_status

      # @!parse
      #   # @param id [Integer]
      #   # @param email [String]
      #   # @param first_name [String]
      #   # @param last_name [String]
      #   # @param password [String]
      #   # @param phone [String]
      #   # @param username [String]
      #   # @param user_status [Integer]
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
