# frozen_string_literal: true

module SamRuby
  module Models
    class DigitalWalletToken < BaseModel
      # @!attribute [rw] id
      #   The Digital Wallet Token identifier.
      #   @return [String]
      required :id, String

      # @!attribute [rw] card_id
      #   The identifier for the Card this Digital Wallet Token belongs to.
      #   @return [String]
      required :card_id, String

      # @!attribute [rw] created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which the Card was created.
      #   @return [String]
      required :created_at, String

      # @!attribute [rw] status
      #   This indicates if payments can be made with the Digital Wallet Token.
      #   @return [Symbol]
      required :status, SamRuby::Enum.new(:active, :inactive, :suspended, :deactivated)

      # @!attribute [rw] token_requestor
      #   The digital wallet app being used.
      #   @return [Symbol]
      required :token_requestor, SamRuby::Enum.new(:apple_pay, :google_pay, :unknown)

      # @!attribute [rw] type
      #   A constant representing the object's type. For this resource it will always be `digital_wallet_token`.
      #   @return [Symbol]
      required :type, SamRuby::Enum.new(:digital_wallet_token)
    end
  end
end
