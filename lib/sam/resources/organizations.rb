# frozen_string_literal: true

module Sam
  module Resources
    class Organizations
      def initialize(client:)
        @client = client
      end

      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :id
      # @option params [String] :friendly_id
      # @option params [String] :name
      # @option params [DefaultLanguage] :default_language
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/organizations"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        req[:model] = Sam::Unknown
        @client.request(req, opts)
      end
    end
  end
end
