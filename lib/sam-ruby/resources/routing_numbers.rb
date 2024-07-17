# frozen_string_literal: true

module SamRuby
  module Resources
    class RoutingNumbers
      def initialize(client:)
        @client = client
      end

      # You can use this API to confirm if a routing number is valid, such as when a
      #   user is providing you with bank account details. Since routing numbers uniquely
      #   identify a bank, this will always return 0 or 1 entry. In Sandbox, the only
      #   valid routing number for this method is 110000000.
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :routing_number Filter financial institutions by routing number.
      # @option params [String] :cursor Return the page of entries after this one.
      # @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Page<SamRuby::Models::RoutingNumber>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/routing_numbers"
        req[:query] = params
        req[:page] = SamRuby::Page
        req[:model] = SamRuby::Models::RoutingNumber
        @client.request(req, opts)
      end
    end
  end
end