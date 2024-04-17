# frozen_string_literal: true

module Sam
  module Resources
    class Actions
      def initialize(client:)
        @client = client
      end

      # @param action_id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def retrieve(action_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/api/v1/actions/#{action_id}"
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end

      # @param action_id [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :action_set_id
      # @option params [String] :agent_id
      # @option params [CreatedBy] :created_by
      # @option params [String] :description
      # @option params [String] :error_message
      # @option params [Symbol] :method
      # @option params [String] :name
      # @option params [Array<Parameter>] :parameters
      # @option params [String] :path
      # @option params [Symbol] :request_body_type
      # @option params [Symbol] :status
      # @option params [UpdatedBy] :updated_by
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(action_id, params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/actions/#{action_id}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end
    end
  end
end
