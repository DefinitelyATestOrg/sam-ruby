# frozen_string_literal: true

module Sam
  module Resources
    class Feedbacks
      def initialize(client:)
        @client = client
      end

      # @param feedback_id [String]
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :agent_id
      # @option params [String] :ticket_message_id
      # @option params [String] :id
      # @option params [CreatedBy] :created_by
      # @option params [String] :text
      # @option params [Symbol] :type
      # @option params [UpdatedBy] :updated_by
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Object]
      def update(feedback_id, params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/api/v1/feedbacks/#{feedback_id}"
        req[:body] = params
        req[:headers] = {"Accept" => "*/*"}
        req[:model] = Sam::Unknown
        @client.request(req, opts)
      end
    end
  end
end
