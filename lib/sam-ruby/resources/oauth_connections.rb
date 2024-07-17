# frozen_string_literal: true

module SamRuby
  module Resources
    class OAuthConnections
      def initialize(client:)
        @client = client
      end

      # Retrieve an OAuth Connection
      # 
      # @param oauth_connection_id [String] The identifier of the OAuth Connection.
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::OAuthConnection]
      def retrieve(oauth_connection_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/oauth_connections/#{oauth_connection_id}"
        req[:model] = SamRuby::Models::OAuthConnection
        @client.request(req, opts)
      end

      # List OAuth Connections
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :cursor Return the page of entries after this one.
      # @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      # @option params [Status] :status
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Page<SamRuby::Models::OAuthConnection>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/oauth_connections"
        req[:query] = params
        req[:page] = SamRuby::Page
        req[:model] = SamRuby::Models::OAuthConnection
        @client.request(req, opts)
      end
    end
  end
end
