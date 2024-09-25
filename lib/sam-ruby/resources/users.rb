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
      # @option params [Integer] :id
      # @option params [String] :email
      # @option params [String] :first_name
      # @option params [String] :last_name
      # @option params [String] :password
      # @option params [String] :phone
      # @option params [String] :username
      # @option params [Integer] :user_status User Status
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
      # @option params [String] :body_username Body param:
      # @option params [Integer] :id Body param:
      # @option params [String] :email Body param:
      # @option params [String] :first_name Body param:
      # @option params [String] :last_name Body param:
      # @option params [String] :password Body param:
      # @option params [String] :phone Body param:
      # @option params [Integer] :user_status Body param: User Status
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
      # @option params [String] :password The password for login in clear text
      # @option params [String] :username The user name for login
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
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
