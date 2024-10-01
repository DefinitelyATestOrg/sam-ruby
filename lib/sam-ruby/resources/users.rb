# frozen_string_literal: true

module SamRuby
  module Resources
    class Users
      def initialize(client:)
        @client = client
      end

      # This can only be done by the logged in user.
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Integer, nil] :id
      # @option params [String, nil] :email
      # @option params [String, nil] :first_name
      # @option params [String, nil] :last_name
      # @option params [String, nil] :password
      # @option params [String, nil] :phone
      # @option params [String, nil] :username
      # @option params [Integer, nil] :user_status User Status
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/user"
        req[:body] = params
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # Get user by user name
      #
      # @param username [String] The name that needs to be fetched. Use user1 for testing.
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::User]
      def retrieve(username, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/user/#{username}"
        req[:model] = SamRuby::Models::User
        @client.request(req, opts)
      end

      # This can only be done by the logged in user.
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String, nil] :body_username Body param:
      # @option params [Integer, nil] :id Body param:
      # @option params [String, nil] :email Body param:
      # @option params [String, nil] :first_name Body param:
      # @option params [String, nil] :last_name Body param:
      # @option params [String, nil] :password Body param:
      # @option params [String, nil] :phone Body param:
      # @option params [Integer, nil] :user_status Body param: User Status
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def update(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/user/#{params.fetch(:path_username)}"
        req[:body] = params
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # This can only be done by the logged in user.
      #
      # @param username [String] The name that needs to be deleted
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def delete(username, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/user/#{username}"
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # Creates list of users with given input array
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<SamRuby::Models::User>] :body
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::User]
      def create_with_list(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/user/createWithList"
        req[:body] = params[:body]
        req[:model] = SamRuby::Models::User
        @client.request(req, opts)
      end

      # Logs user into the system
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String, nil] :password The password for login in clear text
      # @option params [String, nil] :username The user name for login
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [String]
      def login(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/user/login"
        req[:query] = params
        req[:model] = String
        @client.request(req, opts)
      end

      # Logs out current logged in user session
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def logout(opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/user/logout"
        req[:model] = NilClass
        @client.request(req, opts)
      end
    end
  end
end
