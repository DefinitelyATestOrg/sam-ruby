# frozen_string_literal: true

module SamRuby
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client options.
    attr_reader :api_key

    # @return [SamRuby::Resources::Accounts]
    attr_reader :accounts

    # @return [SamRuby::Resources::AccountNumbers]
    attr_reader :account_numbers

    # @return [SamRuby::Resources::BookkeepingAccounts]
    attr_reader :bookkeeping_accounts

    # @return [SamRuby::Resources::BookkeepingEntrySets]
    attr_reader :bookkeeping_entry_sets

    # @return [SamRuby::Resources::BookkeepingEntries]
    attr_reader :bookkeeping_entries

    # @return [SamRuby::Resources::RealTimeDecisions]
    attr_reader :real_time_decisions

    # @return [SamRuby::Resources::RealTimePaymentsTransfers]
    attr_reader :real_time_payments_transfers

    # @return [SamRuby::Resources::Cards]
    attr_reader :cards

    # @return [SamRuby::Resources::CardDisputes]
    attr_reader :card_disputes

    # @return [SamRuby::Resources::CardPurchaseSupplements]
    attr_reader :card_purchase_supplements

    # @return [SamRuby::Resources::ExternalAccounts]
    attr_reader :external_accounts

    # @return [SamRuby::Resources::Exports]
    attr_reader :exports

    # @return [SamRuby::Resources::DigitalWalletTokens]
    attr_reader :digital_wallet_tokens

    # @return [SamRuby::Resources::Transactions]
    attr_reader :transactions

    # @return [SamRuby::Resources::PendingTransactions]
    attr_reader :pending_transactions

    # @return [SamRuby::Resources::Programs]
    attr_reader :programs

    # @return [SamRuby::Resources::DeclinedTransactions]
    attr_reader :declined_transactions

    # @return [SamRuby::Resources::AccountTransfers]
    attr_reader :account_transfers

    # @return [SamRuby::Resources::ACHTransfers]
    attr_reader :ach_transfers

    # @return [SamRuby::Resources::ACHPrenotifications]
    attr_reader :ach_prenotifications

    # @return [SamRuby::Resources::Documents]
    attr_reader :documents

    # @return [SamRuby::Resources::WireTransfers]
    attr_reader :wire_transfers

    # @return [SamRuby::Resources::CheckTransfers]
    attr_reader :check_transfers

    # @return [SamRuby::Resources::Entities]
    attr_reader :entities

    # @return [SamRuby::Resources::InboundACHTransfers]
    attr_reader :inbound_ach_transfers

    # @return [SamRuby::Resources::InboundWireDrawdownRequests]
    attr_reader :inbound_wire_drawdown_requests

    # @return [SamRuby::Resources::WireDrawdownRequests]
    attr_reader :wire_drawdown_requests

    # @return [SamRuby::Resources::Events]
    attr_reader :events

    # @return [SamRuby::Resources::EventSubscriptions]
    attr_reader :event_subscriptions

    # @return [SamRuby::Resources::Files]
    attr_reader :files

    # @return [SamRuby::Resources::Groups]
    attr_reader :groups

    # @return [SamRuby::Resources::OAuthConnections]
    attr_reader :oauth_connections

    # @return [SamRuby::Resources::CheckDeposits]
    attr_reader :check_deposits

    # @return [SamRuby::Resources::RoutingNumbers]
    attr_reader :routing_numbers

    # @return [SamRuby::Resources::AccountStatements]
    attr_reader :account_statements

    # @return [SamRuby::Resources::Simulations]
    attr_reader :simulations

    # @return [SamRuby::Resources::PhysicalCards]
    attr_reader :physical_cards

    # @return [SamRuby::Resources::CardPayments]
    attr_reader :card_payments

    # @return [SamRuby::Resources::ProofOfAuthorizationRequests]
    attr_reader :proof_of_authorization_requests

    # @return [SamRuby::Resources::ProofOfAuthorizationRequestSubmissions]
    attr_reader :proof_of_authorization_request_submissions

    # @return [SamRuby::Resources::Intrafi]
    attr_reader :intrafi

    # @return [SamRuby::Resources::RealTimePaymentsRequestForPayments]
    attr_reader :real_time_payments_request_for_payments

    # @return [SamRuby::Resources::OAuthTokens]
    attr_reader :oauth_tokens

    # @return [SamRuby::Resources::InboundWireTransfers]
    attr_reader :inbound_wire_transfers

    # @return [SamRuby::Resources::DigitalCardProfiles]
    attr_reader :digital_card_profiles

    # @return [SamRuby::Resources::PhysicalCardProfiles]
    attr_reader :physical_card_profiles

    # @return [SamRuby::Resources::InboundCheckDeposits]
    attr_reader :inbound_check_deposits

    # @return [SamRuby::Resources::InboundMailItems]
    attr_reader :inbound_mail_items

    # @return [SamRuby::Resources::Lockboxes]
    attr_reader :lockboxes

    # @!visibility private
    def auth_headers
      {"Authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    def initialize(environment: nil, base_url: nil, api_key: nil, max_retries: nil)
      environments = {"production" => "https://api.increase.com", "sandbox" => "https://sandbox.increase.com"}
      if environment && base_url
        raise ArgumentError, "both environment and base_url given, expected only one"
      elsif environment
        if !environments.key?(environment.to_s)
          raise ArgumentError, "environment must be one of #{environments.keys}, got #{environment}"
        end
        base_url = environments[environment.to_s]
      elsif !base_url
        base_url = "https://api.increase.com"
      end

      max_retries ||= DEFAULT_MAX_RETRIES
      idempotency_header = "Idempotency-Key"

      @api_key = [api_key, ENV["INCREASE_API_KEY"]].find { |v| !v.nil? }
      if @api_key.nil?
        raise ArgumentError, "api_key is required"
      end

      super(base_url: base_url, max_retries: max_retries, idempotency_header: idempotency_header)

      @accounts = SamRuby::Resources::Accounts.new(client: self)
      @account_numbers = SamRuby::Resources::AccountNumbers.new(client: self)
      @bookkeeping_accounts = SamRuby::Resources::BookkeepingAccounts.new(client: self)
      @bookkeeping_entry_sets = SamRuby::Resources::BookkeepingEntrySets.new(client: self)
      @bookkeeping_entries = SamRuby::Resources::BookkeepingEntries.new(client: self)
      @real_time_decisions = SamRuby::Resources::RealTimeDecisions.new(client: self)
      @real_time_payments_transfers = SamRuby::Resources::RealTimePaymentsTransfers.new(client: self)
      @cards = SamRuby::Resources::Cards.new(client: self)
      @card_disputes = SamRuby::Resources::CardDisputes.new(client: self)
      @card_purchase_supplements = SamRuby::Resources::CardPurchaseSupplements.new(client: self)
      @external_accounts = SamRuby::Resources::ExternalAccounts.new(client: self)
      @exports = SamRuby::Resources::Exports.new(client: self)
      @digital_wallet_tokens = SamRuby::Resources::DigitalWalletTokens.new(client: self)
      @transactions = SamRuby::Resources::Transactions.new(client: self)
      @pending_transactions = SamRuby::Resources::PendingTransactions.new(client: self)
      @programs = SamRuby::Resources::Programs.new(client: self)
      @declined_transactions = SamRuby::Resources::DeclinedTransactions.new(client: self)
      @account_transfers = SamRuby::Resources::AccountTransfers.new(client: self)
      @ach_transfers = SamRuby::Resources::ACHTransfers.new(client: self)
      @ach_prenotifications = SamRuby::Resources::ACHPrenotifications.new(client: self)
      @documents = SamRuby::Resources::Documents.new(client: self)
      @wire_transfers = SamRuby::Resources::WireTransfers.new(client: self)
      @check_transfers = SamRuby::Resources::CheckTransfers.new(client: self)
      @entities = SamRuby::Resources::Entities.new(client: self)
      @inbound_ach_transfers = SamRuby::Resources::InboundACHTransfers.new(client: self)
      @inbound_wire_drawdown_requests = SamRuby::Resources::InboundWireDrawdownRequests.new(client: self)
      @wire_drawdown_requests = SamRuby::Resources::WireDrawdownRequests.new(client: self)
      @events = SamRuby::Resources::Events.new(client: self)
      @event_subscriptions = SamRuby::Resources::EventSubscriptions.new(client: self)
      @files = SamRuby::Resources::Files.new(client: self)
      @groups = SamRuby::Resources::Groups.new(client: self)
      @oauth_connections = SamRuby::Resources::OAuthConnections.new(client: self)
      @check_deposits = SamRuby::Resources::CheckDeposits.new(client: self)
      @routing_numbers = SamRuby::Resources::RoutingNumbers.new(client: self)
      @account_statements = SamRuby::Resources::AccountStatements.new(client: self)
      @simulations = SamRuby::Resources::Simulations.new(client: self)
      @physical_cards = SamRuby::Resources::PhysicalCards.new(client: self)
      @card_payments = SamRuby::Resources::CardPayments.new(client: self)
      @proof_of_authorization_requests = SamRuby::Resources::ProofOfAuthorizationRequests.new(client: self)
      @proof_of_authorization_request_submissions = SamRuby::Resources::ProofOfAuthorizationRequestSubmissions.new(client: self)
      @intrafi = SamRuby::Resources::Intrafi.new(client: self)
      @real_time_payments_request_for_payments = SamRuby::Resources::RealTimePaymentsRequestForPayments.new(client: self)
      @oauth_tokens = SamRuby::Resources::OAuthTokens.new(client: self)
      @inbound_wire_transfers = SamRuby::Resources::InboundWireTransfers.new(client: self)
      @digital_card_profiles = SamRuby::Resources::DigitalCardProfiles.new(client: self)
      @physical_card_profiles = SamRuby::Resources::PhysicalCardProfiles.new(client: self)
      @inbound_check_deposits = SamRuby::Resources::InboundCheckDeposits.new(client: self)
      @inbound_mail_items = SamRuby::Resources::InboundMailItems.new(client: self)
      @lockboxes = SamRuby::Resources::Lockboxes.new(client: self)
    end

    # @!visibility private
    def make_status_error(message:, body:, response:)
      case response.code.to_i
      when 500, 500..599
        SamRuby::HTTP::InternalServerError.new(
          message: message,
          response: response,
          body: {detail: nil, status: 500, title: "", type: "internal_server_error"}
        )
      when 400
        SamRuby::HTTP::BadRequestError.new(message: message, response: response, body: body)
      when 401
        SamRuby::HTTP::AuthenticationError.new(message: message, response: response, body: body)
      when 403
        SamRuby::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
      when 404
        SamRuby::HTTP::NotFoundError.new(message: message, response: response, body: body)
      when 409
        SamRuby::HTTP::ConflictError.new(message: message, response: response, body: body)
      when 422
        SamRuby::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
      when 429
        SamRuby::HTTP::RateLimitError.new(message: message, response: response, body: body)
      else
        SamRuby::HTTP::APIStatusError.new(message: message, response: response, body: body)
      end
    end
  end
end
