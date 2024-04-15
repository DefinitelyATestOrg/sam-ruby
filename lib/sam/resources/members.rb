# frozen_string_literal: true

module Sam
  module Resources
    class Members
      def initialize(client:)
        @client = client
      end

      # @param memberId [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :id
      # @option params [String] :email
      # @option params [String] :name
      # @option params [String] :org_id
      # @option params [String] :picture_url
      # @option params [Symbol] :role
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(member_id, params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/members/#{member_id}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        @client.request(req, opts)
      end

      # @param memberId [String]
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [NilClass]
      def delete(member_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/api/v1/members/#{member_id}"
        req[:model] = NilClass
        @client.request(req, opts)
      end
    end
  end
end
