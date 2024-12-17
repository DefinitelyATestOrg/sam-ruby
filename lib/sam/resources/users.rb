# frozen_string_literal: true

module Sam
  module Resources
    class Users
      # @param client [Sam::Client]
      def initialize(client:)
        @client = client
      end

      # This can only be done by the logged in user.
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Integer, nil] :id
      #   @option params [String, nil] :email
      #   @option params [String, nil] :first_name
      #   @option params [String, nil] :last_name
      #   @option params [String, nil] :password
      #   @option params [String, nil] :phone
      #   @option params [String, nil] :username
      #   @option params [Integer, nil] :user_status User Status
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Sam::Models::User]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/user",
          headers: {"Content-Type" => "application/json"},
          body: params,
          model: Sam::Models::User
        }
        @client.request(req, opts)
      end

      # Get user by user name
      #
      # @param username [String] The name that needs to be fetched. Use user1 for testing.
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Sam::Models::User]
      def retrieve(username, opts = {})
        req = {
          method: :get,
          path: "/user/#{username}",
          model: Sam::Models::User
        }
        @client.request(req, opts)
      end

      # This can only be done by the logged in user.
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :body_username Body param:
      #   @option params [Integer, nil] :id Body param:
      #   @option params [String, nil] :email Body param:
      #   @option params [String, nil] :first_name Body param:
      #   @option params [String, nil] :last_name Body param:
      #   @option params [String, nil] :password Body param:
      #   @option params [String, nil] :phone Body param:
      #   @option params [Integer, nil] :user_status Body param: User Status
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def update(params = {}, opts = {})
        path_username = params.fetch(:path_username) do
          raise ArgumentError, "missing required path argument :path_username"
        end
        req = {
          method: :put,
          path: "/user/#{path_username}",
          headers: {"Content-Type" => "application/json"},
          body: params.except(:path_username),
          model: NilClass
        }
        @client.request(req, opts)
      end

      # This can only be done by the logged in user.
      #
      # @param username [String] The name that needs to be deleted
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def delete(username, opts = {})
        req = {
          method: :delete,
          path: "/user/#{username}",
          model: NilClass
        }
        @client.request(req, opts)
      end

      # Creates list of users with given input array
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Array<Sam::Models::User>] :body
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Sam::Models::User]
      def create_with_list(params = {}, opts = {})
        req = {
          method: :post,
          path: "/user/createWithList",
          headers: {"Content-Type" => "application/json"},
          body: params[:body],
          model: Sam::Models::User
        }
        @client.request(req, opts)
      end

      # Logs user into the system
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :password The password for login in clear text
      #   @option params [String, nil] :username The user name for login
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [String]
      def login(params = {}, opts = {})
        req = {
          method: :get,
          path: "/user/login",
          query: params,
          model: String
        }
        @client.request(req, opts)
      end

      # Logs out current logged in user session
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def logout(opts = {})
        req = {
          method: :get,
          path: "/user/logout",
          model: NilClass
        }
        @client.request(req, opts)
      end
    end
  end
end
