# frozen_string_literal: true

module SamRuby
  module Resources
    class Simulations
      class AccountStatements
        def initialize(client:)
          @client = client
        end

        # Simulates an [Account Statement](#account-statements) being created for an
        #   account. In production, Account Statements are generated once per month.
        # 
        # @param params [Hash] Attributes to send in this request.
        # @option params [String] :account_id The identifier of the Account the statement is for.
        # 
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [SamRuby::Models::AccountStatement]
        def create(params = {}, opts = {})
          req = {}
          req[:method] = :post
          req[:path] = "/simulations/account_statements"
          req[:body] = params
          req[:model] = SamRuby::Models::AccountStatement
          @client.request(req, opts)
        end
      end
    end
  end
end
