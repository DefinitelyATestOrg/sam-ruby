# frozen_string_literal: true

module Sam
  module Resources
    class Agents
      attr_reader :hidden_tags, :configs

      def initialize(client:)
        @client = client
        @hidden_tags = Sam::Resources::Agents::HiddenTags.new(client: client)
        @configs = Sam::Resources::Agents::Configs.new(client: client)
      end

      # @param id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def retrieve(id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/api/v1/agents/#{id}"
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end

      # @param id [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Agent] :agent
      # @option params [String] :chat_icon
      # @option params [Boolean] :chat_icon_deleted
      # @option params [String] :logo
      # @option params [Boolean] :logo_deleted
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(id, params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/agents/#{id}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end

      # @param id [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [NilClass]
      def delete(id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/api/v1/agents/#{id}"
        req[:model] = NilClass
        @client.request(req, opts)
      end
    end
  end
end
