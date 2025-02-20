# frozen_string_literal: true

module Sam
  module Resources
    class User
      # This can only be done by the logged in user.
      #
      # @param params [Sam::Models::UserCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Integer] :id
      #
      #   @option params [String] :email
      #
      #   @option params [String] :first_name
      #
      #   @option params [String] :last_name
      #
      #   @option params [String] :password
      #
      #   @option params [String] :phone
      #
      #   @option params [String] :username
      #
      #   @option params [Integer] :user_status User Status
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Sam::Models::UserAPI]
      #
      def create(params = {})
        parsed, options = Sam::Models::UserCreateParams.dump_request(params)
        @client.request(method: :post, path: "user", body: parsed, model: Sam::Models::UserAPI, options: options)
      end

      # Get user by user name
      #
      # @param username [String] The name that needs to be fetched. Use user1 for testing.
      #
      # @param params [Sam::Models::UserRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Sam::Models::UserAPI]
      #
      def retrieve(username, params = {})
        @client.request(
          method: :get,
          path: ["user/%0s", username],
          model: Sam::Models::UserAPI,
          options: params[:request_options]
        )
      end

      # This can only be done by the logged in user.
      #
      # @param path_username [String] name that needs to be updated
      #
      # @param params [Sam::Models::UserUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Integer] :id
      #
      #   @option params [String] :email
      #
      #   @option params [String] :first_name
      #
      #   @option params [String] :last_name
      #
      #   @option params [String] :password
      #
      #   @option params [String] :phone
      #
      #   @option params [String] :body_username
      #
      #   @option params [Integer] :user_status User Status
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [nil]
      #
      def update(path_username, params = {})
        parsed, options = Sam::Models::UserUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["user/%0s", path_username],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # This can only be done by the logged in user.
      #
      # @param username [String] The name that needs to be deleted
      #
      # @param params [Sam::Models::UserDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [nil]
      #
      def delete(username, params = {})
        @client.request(
          method: :delete,
          path: ["user/%0s", username],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Creates list of users with given input array
      #
      # @param params [Sam::Models::UserCreateListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<Sam::Models::UserAPI>] :body
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Sam::Models::UserAPI]
      #
      def create_list(params = {})
        parsed, options = Sam::Models::UserCreateListParams.dump_request(params)
        @client.request(
          method: :post,
          path: "user/createWithList",
          body: parsed[:body],
          model: Sam::Models::UserAPI,
          options: options
        )
      end

      # Logs user into the system
      #
      # @param params [Sam::Models::UserLoginParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :password The password for login in clear text
      #
      #   @option params [String] :username The user name for login
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [String]
      #
      def login(params = {})
        parsed, options = Sam::Models::UserLoginParams.dump_request(params)
        @client.request(method: :get, path: "user/login", query: parsed, model: String, options: options)
      end

      # Logs out current logged in user session
      #
      # @param params [Sam::Models::UserLogoutParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Sam::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [nil]
      #
      def logout(params = {})
        @client.request(method: :get, path: "user/logout", model: NilClass, options: params[:request_options])
      end

      # @param client [Sam::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
