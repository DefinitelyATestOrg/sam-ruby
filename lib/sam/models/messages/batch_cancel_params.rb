# frozen_string_literal: true

module Sam
  module Models
    module Messages
      # @see Sam::Resources::Messages::Batches#cancel
      class BatchCancelParams < Sam::Internal::Type::BaseModel
        extend Sam::Internal::Type::RequestParameters::Converter
        include Sam::Internal::Type::RequestParameters

        # @!attribute message_batch_id
        #   ID of the Message Batch.
        #
        #   @return [String]
        required :message_batch_id, String

        # @!attribute anthropic_beta
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #   the header multiple times for each beta.
        #
        #   @return [Array<String>, nil]
        optional :anthropic_beta, Sam::Internal::Type::ArrayOf[String]

        # @!attribute anthropic_version
        #   The version of the Anthropic API you want to use.
        #
        #   Read more about versioning and our version history
        #   [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @return [String, nil]
        optional :anthropic_version, String

        # @!attribute x_api_key
        #   Your unique API key for authentication.
        #
        #   This key is required in the header of all API requests, to authenticate your
        #   account and access Anthropic's services. Get your API key through the
        #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #   Workspace.
        #
        #   @return [String, nil]
        optional :x_api_key, String

        # @!method initialize(message_batch_id:, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sam::Models::Messages::BatchCancelParams} for more details.
        #
        #   @param message_batch_id [String] ID of the Message Batch.
        #
        #   @param anthropic_beta [Array<String>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param anthropic_version [String] The version of the Anthropic API you want to use.
        #
        #   @param x_api_key [String] Your unique API key for authentication.
        #
        #   @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
