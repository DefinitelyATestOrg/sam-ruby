# frozen_string_literal: true

module Sam
  module Resources
    class Corpora
      def initialize(client:)
        @client = client
      end

      # @param corpus_id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def retrieve(corpus_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/api/v1/corpora/#{corpus_id}"
        req[:headers] = {"Accept" => "*/*"}
        req[:model] = Sam::Unknown
        @client.request(req, opts)
      end

      # @param corpus_id [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :agent_id
      # @option params [String] :name
      # @option params [Boolean] :active
      # @option params [CrawlSpec] :crawl_spec
      # @option params [CreatedBy] :created_by
      # @option params [String] :exclude_last_updated_before
      # @option params [Symbol] :html_transformer
      # @option params [Array<String>] :included_kb_article_ids
      # @option params [Symbol] :integration
      # @option params [String] :integration_category_id
      # @option params [String] :source_url
      # @option params [Symbol] :status
      # @option params [Array<String>] :tags
      # @option params [Symbol] :type
      # @option params [UpdatedBy] :updated_by
      # @option params [Array<String>] :url_exclusion_patterns
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(corpus_id, params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/corpora/#{corpus_id}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        req[:model] = Sam::Unknown
        @client.request(req, opts)
      end

      # @param corpus_id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [nil]
      def delete(corpus_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/api/v1/corpora/#{corpus_id}"
        req[:model] = NilClass
        @client.request(req, opts)
      end
    end
  end
end
