# typed: strong

module Sam
  module Models
    module Messages
      class BatchCancelParams < Sam::BaseModel
        extend Sam::RequestParameters::Converter
        include Sam::RequestParameters

        # Optional header to specify the beta version(s) you want to use.
        #
        #   To use multiple betas, use a comma separated list like `beta1,beta2` or specify
        #   the header multiple times for each beta.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :anthropic_beta

        sig { params(anthropic_beta: T::Array[String]).void }
        attr_writer :anthropic_beta

        # The version of the Anthropic API you want to use.
        #
        #   Read more about versioning and our version history
        #   [here](https://docs.anthropic.com/en/api/versioning).
        sig { returns(T.nilable(String)) }
        attr_reader :anthropic_version

        sig { params(anthropic_version: String).void }
        attr_writer :anthropic_version

        # Your unique API key for authentication.
        #
        #   This key is required in the header of all API requests, to authenticate your
        #   account and access Anthropic's services. Get your API key through the
        #   [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
        #   Workspace.
        sig { returns(T.nilable(String)) }
        attr_reader :x_api_key

        sig { params(x_api_key: String).void }
        attr_writer :x_api_key

        sig do
          params(
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.any(Sam::RequestOptions, Sam::Util::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(anthropic_beta: nil, anthropic_version: nil, x_api_key: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                anthropic_beta: T::Array[String],
                anthropic_version: String,
                x_api_key: String,
                request_options: Sam::RequestOptions
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
