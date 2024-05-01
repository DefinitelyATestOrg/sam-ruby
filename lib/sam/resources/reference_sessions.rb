# frozen_string_literal: true

module Sam
  module Resources
    class ReferenceSessions
      def initialize(client:)
        @client = client
      end

      # @param id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def retrieve(id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/api/v1/referencesessions/#{id}"
        req[:headers] = {"Accept" => "*/*"}
        req[:model] = Sam::Unknown
        @client.request(req, opts)
      end

      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :body_id Body param:
      # @option params [CreatedBy] :created_by Body param:
      # @option params [Array<Question>] :questions Body param:
      # @option params [String] :reference_set_id Body param:
      # @option params [UpdatedBy] :updated_by Body param:
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/referencesessions/#{params.fetch(:path_id)}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        req[:model] = Sam::Unknown
        @client.request(req, opts)
      end

      # @param id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [nil]
      def delete(id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/api/v1/referencesessions/#{id}"
        req[:model] = NilClass
        @client.request(req, opts)
      end
    end
  end
end
