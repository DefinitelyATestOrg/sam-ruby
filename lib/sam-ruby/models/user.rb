# frozen_string_literal: true

module SamRuby
  module Models
    class User < BaseModel
      # @!attribute [rw] id
      #   @return [Integer]
      optional :id, Integer

      # @!attribute [rw] email
      #   @return [String]
      optional :email, String

      # @!attribute [rw] first_name
      #   @return [String]
      optional :first_name, String

      # @!attribute [rw] last_name
      #   @return [String]
      optional :last_name, String

      # @!attribute [rw] password
      #   @return [String]
      optional :password, String

      # @!attribute [rw] phone
      #   @return [String]
      optional :phone, String

      # @!attribute [rw] username
      #   @return [String]
      optional :username, String

      # @!attribute [rw] user_status
      #   User Status
      #   @return [Integer]
      optional :user_status, Integer
    end
  end
end
