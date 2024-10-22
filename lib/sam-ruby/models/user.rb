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
      optional :first_name, String, api_name: :firstName

      # @!attribute [rw] last_name
      #   @return [String]
      optional :last_name, String, api_name: :lastName

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
      optional :user_status, Integer, api_name: :userStatus

      # @!parse
      #   # Create a new instance of User from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer, nil] :id
      #   #   @option data [String, nil] :email
      #   #   @option data [String, nil] :firstName
      #   #   @option data [String, nil] :lastName
      #   #   @option data [String, nil] :password
      #   #   @option data [String, nil] :phone
      #   #   @option data [String, nil] :username
      #   #   @option data [Integer, nil] :userStatus User Status
      #   def initialize(data = {}) = super
    end
  end
end
