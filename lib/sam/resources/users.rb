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
      # @param params [Hash{Symbol => Object}, Sam::Models::UserCreateParams] Attributes to send in this request.
      #
      #   @option params [Integer, nil] :id
      #
      #   @option params [String, nil] :email
      #
      #   @option params [String, nil] :first_name
      #
      #   @option params [String, nil] :last_name
      #
      #   @option params [String, nil] :password
      #
      #   @option params [String, nil] :phone
      #
      #   @option params [String, nil] :username
      #
      #   @option params [Integer, nil] :user_status User Status
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Sam::Models::User]
      def create(params = {}, opts = {})
        parsed = Sam::Models::UserCreateParams.dump(params)
        req = {
          method: :post,
          path: "/user",
          body: parsed,
          model: Sam::Models::User
        }
        @client.request(req, opts)
      end

      # Get user by user name
      #
      # @param username [String] The name that needs to be fetched. Use user1 for testing.
      #
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
      # @param params [Hash{Symbol => Object}, Sam::Models::UserUpdateParams] Attributes to send in this request.
      #
      #   @option params [String, nil] :body_username Body param:
      #
      #   @option params [Integer, nil] :id Body param:
      #
      #   @option params [String, nil] :email Body param:
      #
      #   @option params [String, nil] :first_name Body param:
      #
      #   @option params [String, nil] :last_name Body param:
      #
      #   @option params [String, nil] :password Body param:
      #
      #   @option params [String, nil] :phone Body param:
      #
      #   @option params [Integer, nil] :user_status Body param: User Status
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def update(params = {}, opts = {})
        parsed = Sam::Models::UserUpdateParams.dump(params)
        path_username = parsed.fetch(:path_username) do
          raise ArgumentError.new("missing required path argument :path_username")
        end
        req = {
          method: :put,
          path: "/user/#{path_username}",
          body: parsed.except(:path_username),
          model: NilClass
        }
        @client.request(req, opts)
      end

      # This can only be done by the logged in user.
      #
      # @param username [String] The name that needs to be deleted
      #
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
      # @param params [Hash{Symbol => Object}, Sam::Models::UserCreateWithListParams] Attributes to send in this request.
      #
      #   @option params [Array<Sam::Models::User>] :body
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Sam::Models::User]
      def create_with_list(params = {}, opts = {})
        parsed = Sam::Models::UserCreateWithListParams.dump(params)
        req = {
          method: :post,
          path: "/user/createWithList",
          body: parsed[:body],
          model: Sam::Models::User
        }
        @client.request(req, opts)
      end

      # Logs user into the system
      #
      # @param params [Hash{Symbol => Object}, Sam::Models::UserLoginParams] Attributes to send in this request.
      #
      #   @option params [String, nil] :password The password for login in clear text
      #
      #   @option params [String, nil] :username The user name for login
      #
      # @param opts [Hash{Symbol => Object}, Sam::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [String]
      def login(params = {}, opts = {})
        parsed = Sam::Models::UserLoginParams.dump(params)
        req = {
          method: :get,
          path: "/user/login",
          query: parsed,
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