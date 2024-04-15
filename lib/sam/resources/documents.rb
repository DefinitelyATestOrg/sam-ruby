# frozen_string_literal: true

module Sam
  module Resources
    class Documents
      def initialize(client:)
        @client = client
      end

      # @param doc_id [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Boolean] :text
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def retrieve(doc_id, params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/api/v1/document/#{doc_id}"
        req[:query] = params
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end

      # @param doc_id [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :id
      # @option params [Symbol] :corpus_policy
      # @option params [CreatedBy] :created_by
      # @option params [String] :external_lookup_key
      # @option params [LanguageCode] :language_code
      # @option params [Integer] :processing_version
      # @option params [String] :source_author
      # @option params [String] :source_created_at
      # @option params [String] :source_updated_at
      # @option params [String] :source_url
      # @option params [String] :text
      # @option params [String] :title
      # @option params [UpdatedBy] :updated_by
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(doc_id, params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/document/#{doc_id}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end

      # @param doc_id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [NilClass]
      def delete(doc_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/api/v1/document/#{doc_id}"
        req[:model] = NilClass
        @client.request(req, opts)
      end
    end
  end
end
