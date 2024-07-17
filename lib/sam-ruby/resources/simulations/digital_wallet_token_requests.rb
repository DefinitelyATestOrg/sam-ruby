# frozen_string_literal: true

module SamRuby
  module Resources
    class Simulations
      class DigitalWalletTokenRequests
        def initialize(client:)
          @client = client
        end

        # Simulates a user attempting add a [Card](#cards) to a digital wallet such as
        #   Apple Pay.
        # 
        # @param params [Hash] Attributes to send in this request.
        # @option params [String] :card_id The identifier of the Card to be authorized.
        # 
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        # 
        # @return [SamRuby::Models::DigitalWalletTokenRequestCreateResponse]
        def create(params = {}, opts = {})
          req = {}
          req[:method] = :post
          req[:path] = "/simulations/digital_wallet_token_requests"
          req[:body] = params
          req[:model] = SamRuby::Models::DigitalWalletTokenRequestCreateResponse
          @client.request(req, opts)
        end
      end
    end
  end
end
