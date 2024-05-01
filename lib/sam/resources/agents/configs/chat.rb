# frozen_string_literal: true

module Sam
  module Resources
    class Agents
      class Configs
        class Chat
          def initialize(client:)
            @client = client
          end

          # @param agent_id [String]
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Object]
          def retrieve(agent_id, opts = {})
            req = {}
            req[:method] = :get
            req[:path] = "/api/v1/agents/#{agent_id}/configs/chat"
            req[:headers] = {"Accept" => "*/*"}
            req[:model] = Sam::Unknown
            @client.request(req, opts)
          end

          # @param agent_id [String]
          # 
          # @param params [Hash] Attributes to send in this request.
          # @option params [String] :id
          # @option params [String] :welcome_message
          # 
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Object]
          def update(agent_id, params = {}, opts = {})
            req = {}
            req[:method] = :put
            req[:path] = "/api/v1/agents/#{agent_id}/configs/chat"
            req[:body] = params
            req[:headers] = {"Accept" => "*/*"}
            req[:model] = Sam::Unknown
            @client.request(req, opts)
          end
        end
      end
    end
  end
end
