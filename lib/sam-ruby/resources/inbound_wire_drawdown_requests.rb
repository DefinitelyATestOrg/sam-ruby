# frozen_string_literal: true

module SamRuby
  module Resources
    class InboundWireDrawdownRequests
      def initialize(client:)
        @client = client
      end

      # Retrieve an Inbound Wire Drawdown Request
      # 
      # @param inbound_wire_drawdown_request_id [String] The identifier of the Inbound Wire Drawdown Request to retrieve.
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::InboundWireDrawdownRequest]
      def retrieve(inbound_wire_drawdown_request_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/inbound_wire_drawdown_requests/#{inbound_wire_drawdown_request_id}"
        req[:model] = SamRuby::Models::InboundWireDrawdownRequest
        @client.request(req, opts)
      end

      # List Inbound Wire Drawdown Requests
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :cursor Return the page of entries after this one.
      # @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Page<SamRuby::Models::InboundWireDrawdownRequest>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/inbound_wire_drawdown_requests"
        req[:query] = params
        req[:page] = SamRuby::Page
        req[:model] = SamRuby::Models::InboundWireDrawdownRequest
        @client.request(req, opts)
      end
    end
  end
end
