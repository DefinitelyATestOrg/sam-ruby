# frozen_string_literal: true

module Sam
  module Resources
    class Agents
      class HiddenTags
        def initialize(client:)
          @client = client
        end

        # @param id [String]
        # 
        # @param params [Hash] Attributes to send in this request.
        # @option params [Array<String>] :body
        # 
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [Object]
        def update(id, params = {}, opts = {})
          req = {}
          req[:method] = :put
          req[:path] = "/api/v1/agents/#{id}/hiddenTags"
          req[:body] = params[:body]
          req[:headers] = {"Accept" => "*/*"}
          @client.request(req, opts)
        end
      end
    end
  end
end
