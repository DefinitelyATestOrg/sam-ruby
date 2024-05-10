# frozen_string_literal: true

module Sam
  module Resources
    class Agents
      class Configs
        # @return [Sam::Resources::Agents::Configs::Chat]
        attr_reader :chat

        def initialize(client:)
          @client = client
          @chat = Sam::Resources::Agents::Configs::Chat.new(client: client)
        end

        # @param agent_id [String]
        # @param integration [Symbol]
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [Object]
        def retrieve(agent_id, integration, opts = {})
          req = {}
          req[:method] = :get
          req[:path] = "/api/v1/agents/#{agent_id}/configs/#{integration}"
          req[:headers] = {"Accept" => "*/*"}
          req[:model] = Sam::Unknown
          @client.request(req, opts)
        end

        # @param agent_id [String]
        # 
        # @param integration [Symbol]
        # 
        # @param params [Hash] Attributes to send in this request.
        # @option params [String] :class_
        # 
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [Object]
        def update(agent_id, integration, params = {}, opts = {})
          req = {}
          req[:method] = :put
          req[:path] = "/api/v1/agents/#{agent_id}/configs/#{integration}"
          req[:body] = params
          req[:headers] = {"Accept" => "*/*"}
          req[:model] = Sam::Unknown
          @client.request(req, opts)
        end
      end
    end
  end
end
