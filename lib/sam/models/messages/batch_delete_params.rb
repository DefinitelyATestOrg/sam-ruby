# frozen_string_literal: true

module Sam
  module Models
    module Messages
      # @see Sam::Resources::Messages::Batches#delete
      class BatchDeleteParams < Sam::Internal::Type::BaseModel
        # @!parse
        #   extend Sam::Internal::Type::RequestParameters::Converter
        include Sam::Internal::Type::RequestParameters

        # @!attribute [r] anthropic_beta
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #   the header multiple times for each beta.
        #
        #   @return [Array<String>, nil]
        optional :anthropic_beta, Sam::Internal::Type::ArrayOf[String], api_name: :"anthropic-beta"

        # @!parse
        #   # @return [Array<String>]
        #   attr_writer :anthropic_beta

        # @!attribute [r] anthropic_version
        #   The version of the Anthropic API you want to use.
        #
        #   Read more about versioning and our version history
        #   [here](https://docs.anthropic.com/en/api/versioning).
        #
        #   @return [String, nil]
        optional :anthropic_version, String, api_name: :"anthropic-version"

        # @!parse
        #   # @return [String]
        #   attr_writer :anthropic_version

        # @!attribute [r] x_api_key
        #   Your unique API key for authentication.
        #
        #   This key is required in the header of all API requests, to authenticate your
        #   account and access Anthropic's services. Get your API key through the
        #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #   Workspace.
        #
        #   @return [String, nil]
        optional :x_api_key, String, api_name: :"x-api-key"

        # @!parse
        #   # @return [String]
        #   attr_writer :x_api_key

        # @!parse
        #   # @param anthropic_beta [Array<String>]
        #   # @param anthropic_version [String]
        #   # @param x_api_key [String]
        #   # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {}, **) = super

        # def initialize: (Hash | Sam::Internal::Type::BaseModel) -> void
      end
    end
  end
end
