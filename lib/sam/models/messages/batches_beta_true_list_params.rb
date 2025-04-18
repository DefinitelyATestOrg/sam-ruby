# frozen_string_literal: true

module Sam
  module Models
    module Messages
      # @see Sam::Resources::Messages::BatchesBetaTrue#list
      class BatchesBetaTrueListParams < Sam::Internal::Type::BaseModel
        extend Sam::Internal::Type::RequestParameters::Converter
        include Sam::Internal::Type::RequestParameters

        # @!attribute after_id
        #   ID of the object to use as a cursor for pagination. When provided, returns the
        #   page of results immediately after this object.
        #
        #   @return [String, nil]
        optional :after_id, String

        # @!attribute before_id
        #   ID of the object to use as a cursor for pagination. When provided, returns the
        #   page of results immediately before this object.
        #
        #   @return [String, nil]
        optional :before_id, String

        # @!attribute limit
        #   Number of items to return per page.
        #
        #   Defaults to `20`. Ranges from `1` to `1000`.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

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

        # @!method initialize(after_id: nil, before_id: nil, limit: nil, anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        #   @param after_id [String]
        #   @param before_id [String]
        #   @param limit [Integer]
        #   @param anthropic_beta [Array<String>]
        #   @param anthropic_version [String]
        #   @param x_api_key [String]
        #   @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
