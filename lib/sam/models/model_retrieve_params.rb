# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::Models#retrieve
    class ModelRetrieveParams < Sam::Internal::Type::BaseModel
      extend Sam::Internal::Type::RequestParameters::Converter
      include Sam::Internal::Type::RequestParameters

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

      # @!method initialize(anthropic_version: nil, x_api_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sam::Models::ModelRetrieveParams} for more details.
      #
      #   @param anthropic_version [String] The version of the Anthropic API you want to use.
      #
      #   @param x_api_key [String] Your unique API key for authentication.
      #
      #   @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
