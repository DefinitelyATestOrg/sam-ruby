# frozen_string_literal: true

module SamRuby
  module Resources
    class Intrafi
      # @return [SamRuby::Resources::Intrafi::AccountEnrollments]
      attr_reader :account_enrollments

      # @return [SamRuby::Resources::Intrafi::Balances]
      attr_reader :balances

      # @return [SamRuby::Resources::Intrafi::Exclusions]
      attr_reader :exclusions

      def initialize(client:)
        @client = client
        @account_enrollments = SamRuby::Resources::Intrafi::AccountEnrollments.new(client: client)
        @balances = SamRuby::Resources::Intrafi::Balances.new(client: client)
        @exclusions = SamRuby::Resources::Intrafi::Exclusions.new(client: client)
      end
    end
  end
end
