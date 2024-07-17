# frozen_string_literal: true

module SamRuby
  module Resources
    class Simulations
      # @return [SamRuby::Resources::Simulations::AccountTransfers]
      attr_reader :account_transfers

      # @return [SamRuby::Resources::Simulations::AccountStatements]
      attr_reader :account_statements

      # @return [SamRuby::Resources::Simulations::ACHTransfers]
      attr_reader :ach_transfers

      # @return [SamRuby::Resources::Simulations::CardDisputes]
      attr_reader :card_disputes

      # @return [SamRuby::Resources::Simulations::CardRefunds]
      attr_reader :card_refunds

      # @return [SamRuby::Resources::Simulations::CheckTransfers]
      attr_reader :check_transfers

      # @return [SamRuby::Resources::Simulations::Documents]
      attr_reader :documents

      # @return [SamRuby::Resources::Simulations::DigitalWalletTokenRequests]
      attr_reader :digital_wallet_token_requests

      # @return [SamRuby::Resources::Simulations::CheckDeposits]
      attr_reader :check_deposits

      # @return [SamRuby::Resources::Simulations::Programs]
      attr_reader :programs

      # @return [SamRuby::Resources::Simulations::InboundWireDrawdownRequests]
      attr_reader :inbound_wire_drawdown_requests

      # @return [SamRuby::Resources::Simulations::InboundFundsHolds]
      attr_reader :inbound_funds_holds

      # @return [SamRuby::Resources::Simulations::InterestPayments]
      attr_reader :interest_payments

      # @return [SamRuby::Resources::Simulations::WireTransfers]
      attr_reader :wire_transfers

      # @return [SamRuby::Resources::Simulations::Cards]
      attr_reader :cards

      # @return [SamRuby::Resources::Simulations::RealTimePaymentsTransfers]
      attr_reader :real_time_payments_transfers

      # @return [SamRuby::Resources::Simulations::PhysicalCards]
      attr_reader :physical_cards

      # @return [SamRuby::Resources::Simulations::InboundCheckDeposits]
      attr_reader :inbound_check_deposits

      # @return [SamRuby::Resources::Simulations::InboundInternationalACHTransfers]
      attr_reader :inbound_international_ach_transfers

      def initialize(client:)
        @client = client
        @account_transfers = SamRuby::Resources::Simulations::AccountTransfers.new(client: client)
        @account_statements = SamRuby::Resources::Simulations::AccountStatements.new(client: client)
        @ach_transfers = SamRuby::Resources::Simulations::ACHTransfers.new(client: client)
        @card_disputes = SamRuby::Resources::Simulations::CardDisputes.new(client: client)
        @card_refunds = SamRuby::Resources::Simulations::CardRefunds.new(client: client)
        @check_transfers = SamRuby::Resources::Simulations::CheckTransfers.new(client: client)
        @documents = SamRuby::Resources::Simulations::Documents.new(client: client)
        @digital_wallet_token_requests = SamRuby::Resources::Simulations::DigitalWalletTokenRequests.new(client: client)
        @check_deposits = SamRuby::Resources::Simulations::CheckDeposits.new(client: client)
        @programs = SamRuby::Resources::Simulations::Programs.new(client: client)
        @inbound_wire_drawdown_requests = SamRuby::Resources::Simulations::InboundWireDrawdownRequests.new(client: client)
        @inbound_funds_holds = SamRuby::Resources::Simulations::InboundFundsHolds.new(client: client)
        @interest_payments = SamRuby::Resources::Simulations::InterestPayments.new(client: client)
        @wire_transfers = SamRuby::Resources::Simulations::WireTransfers.new(client: client)
        @cards = SamRuby::Resources::Simulations::Cards.new(client: client)
        @real_time_payments_transfers = SamRuby::Resources::Simulations::RealTimePaymentsTransfers.new(client: client)
        @physical_cards = SamRuby::Resources::Simulations::PhysicalCards.new(client: client)
        @inbound_check_deposits = SamRuby::Resources::Simulations::InboundCheckDeposits.new(client: client)
        @inbound_international_ach_transfers = SamRuby::Resources::Simulations::InboundInternationalACHTransfers.new(client: client)
      end

      # Simulates expiring a card authorization immediately.
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :card_payment_id The identifier of the Card Payment to expire.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::CardPayment]
      def card_authorization_expirations(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/simulations/card_authorization_expirations"
        req[:body] = params
        req[:model] = SamRuby::Models::CardPayment
        @client.request(req, opts)
      end

      # Simulates the fuel confirmation of an authorization by a card acquirer. This
      #   happens asynchronously right after a fuel pump transaction is completed. A fuel
      #   confirmation can only happen once per authorization.
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Integer] :amount The amount of the fuel_confirmation in minor units in the card authorization's
      #   currency.
      # @option params [String] :card_payment_id The identifier of the Card Payment to create a fuel_confirmation on.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::CardPayment]
      def card_fuel_confirmations(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/simulations/card_fuel_confirmations"
        req[:body] = params
        req[:model] = SamRuby::Models::CardPayment
        @client.request(req, opts)
      end

      # Simulates the increment of an authorization by a card acquirer. An authorization
      #   can be incremented multiple times.
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Integer] :amount The amount of the increment in minor units in the card authorization's currency.
      # @option params [String] :card_payment_id The identifier of the Card Payment to create a increment on.
      # @option params [String] :event_subscription_id The identifier of the Event Subscription to use. If provided, will override the
      #   default real time event subscription. Because you can only create one real time
      #   decision event subscription, you can use this field to route events to any
      #   specified event subscription for testing purposes.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::CardPayment]
      def card_increments(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/simulations/card_increments"
        req[:body] = params
        req[:model] = SamRuby::Models::CardPayment
        @client.request(req, opts)
      end

      # Simulates the reversal of an authorization by a card acquirer. An authorization
      #   can be partially reversed multiple times, up until the total authorized amount.
      #   Marks the pending transaction as complete if the authorization is fully
      #   reversed.
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :card_payment_id The identifier of the Card Payment to create a reversal on.
      # @option params [Integer] :amount The amount of the reversal in minor units in the card authorization's currency.
      #   This defaults to the authorization amount.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::CardPayment]
      def card_reversals(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/simulations/card_reversals"
        req[:body] = params
        req[:model] = SamRuby::Models::CardPayment
        @client.request(req, opts)
      end
    end
  end
end
