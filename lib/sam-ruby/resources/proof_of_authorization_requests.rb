# frozen_string_literal: true

module SamRuby
  module Resources
    class ProofOfAuthorizationRequests
      def initialize(client:)
        @client = client
      end

      # Retrieve a Proof of Authorization Request
      # 
      # @param proof_of_authorization_request_id [String] The identifier of the Proof of Authorization Request.
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::ProofOfAuthorizationRequest]
      def retrieve(proof_of_authorization_request_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/proof_of_authorization_requests/#{proof_of_authorization_request_id}"
        req[:model] = SamRuby::Models::ProofOfAuthorizationRequest
        @client.request(req, opts)
      end

      # List Proof of Authorization Requests
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [CreatedAt] :created_at
      # @option params [String] :cursor Return the page of entries after this one.
      # @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Page<SamRuby::Models::ProofOfAuthorizationRequest>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/proof_of_authorization_requests"
        req[:query] = params
        req[:page] = SamRuby::Page
        req[:model] = SamRuby::Models::ProofOfAuthorizationRequest
        @client.request(req, opts)
      end
    end
  end
end
