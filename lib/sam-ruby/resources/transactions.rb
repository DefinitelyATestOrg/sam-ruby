# frozen_string_literal: true

module SamRuby
  module Resources
    class Transactions
      def initialize(client:)
        @client = client
      end

      # Retrieve a Transaction
      # 
      # @param transaction_id [String] The identifier of the Transaction to retrieve.
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::Transaction]
      def retrieve(transaction_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/transactions/#{transaction_id}"
        req[:model] = SamRuby::Models::Transaction
        @client.request(req, opts)
      end

      # List Transactions
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :account_id Filter Transactions for those belonging to the specified Account.
      # @option params [Category] :category
      # @option params [CreatedAt] :created_at
      # @option params [String] :cursor Return the page of entries after this one.
      # @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      # @option params [String] :route_id Filter Transactions for those belonging to the specified route. This could be a
      #   Card ID or an Account Number ID.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Page<SamRuby::Models::Transaction>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/transactions"
        req[:query] = params
        req[:page] = SamRuby::Page
        req[:model] = SamRuby::Models::Transaction
        @client.request(req, opts)
      end
    end
  end
end
