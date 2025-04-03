# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::Complete#create
    class CompleteCreateParams < Sam::BaseModel
      # @!parse
      #   extend Sam::Internal::Type::RequestParameters::Converter
      include Sam::Internal::Type::RequestParameters

      # @!attribute max_tokens_to_sample
      #   The maximum number of tokens to generate before stopping.
      #
      #     Note that our models may stop _before_ reaching this maximum. This parameter
      #     only specifies the absolute maximum number of tokens to generate.
      #
      #   @return [Integer]
      required :max_tokens_to_sample, Integer

      # @!attribute model
      #   The model that will complete your prompt.
      #
      #     See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #     details and options.
      #
      #   @return [String]
      required :model, String

      # @!attribute prompt
      #   The prompt that you want Claude to complete.
      #
      #     For proper response generation you will need to format your prompt using
      #     alternating `\n\nHuman:` and `\n\nAssistant:` conversational turns. For example:
      #
      #     ```
      #     "\n\nHuman: {userQuestion}\n\nAssistant:"
      #     ```
      #
      #     See [prompt validation](https://docs.anthropic.com/en/api/prompt-validation) and
      #     our guide to
      #     [prompt design](https://docs.anthropic.com/en/docs/intro-to-prompting) for more
      #     details.
      #
      #   @return [String]
      required :prompt, String

      # @!attribute [r] metadata
      #   An object describing metadata about the request.
      #
      #   @return [Sam::Models::CompleteCreateParams::Metadata, nil]
      optional :metadata, -> { Sam::Models::CompleteCreateParams::Metadata }

      # @!parse
      #   # @return [Sam::Models::CompleteCreateParams::Metadata]
      #   attr_writer :metadata

      # @!attribute [r] stop_sequences
      #   Sequences that will cause the model to stop generating.
      #
      #     Our models stop on `"\n\nHuman:"`, and may include additional built-in stop
      #     sequences in the future. By providing the stop_sequences parameter, you may
      #     include additional strings that will cause the model to stop generating.
      #
      #   @return [Array<String>, nil]
      optional :stop_sequences, Sam::ArrayOf[String]

      # @!parse
      #   # @return [Array<String>]
      #   attr_writer :stop_sequences

      # @!attribute [r] stream
      #   Whether to incrementally stream the response using server-sent events.
      #
      #     See [streaming](https://docs.anthropic.com/en/api/streaming) for details.
      #
      #   @return [Boolean, nil]
      optional :stream, Sam::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :stream

      # @!attribute [r] temperature
      #   Amount of randomness injected into the response.
      #
      #     Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
      #     for analytical / multiple choice, and closer to `1.0` for creative and
      #     generative tasks.
      #
      #     Note that even with `temperature` of `0.0`, the results will not be fully
      #     deterministic.
      #
      #   @return [Float, nil]
      optional :temperature, Float

      # @!parse
      #   # @return [Float]
      #   attr_writer :temperature

      # @!attribute [r] top_k
      #   Only sample from the top K options for each subsequent token.
      #
      #     Used to remove "long tail" low probability responses.
      #     [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @return [Integer, nil]
      optional :top_k, Integer

      # @!parse
      #   # @return [Integer]
      #   attr_writer :top_k

      # @!attribute [r] top_p
      #   Use nucleus sampling.
      #
      #     In nucleus sampling, we compute the cumulative distribution over all the options
      #     for each subsequent token in decreasing probability order and cut it off once it
      #     reaches a particular probability specified by `top_p`. You should either alter
      #     `temperature` or `top_p`, but not both.
      #
      #     Recommended for advanced use cases only. You usually only need to use
      #     `temperature`.
      #
      #   @return [Float, nil]
      optional :top_p, Float

      # @!parse
      #   # @return [Float]
      #   attr_writer :top_p

      # @!attribute [r] anthropic_version
      #   The version of the Anthropic API you want to use.
      #
      #     Read more about versioning and our version history
      #     [here](https://docs.anthropic.com/en/api/versioning).
      #
      #   @return [String, nil]
      optional :anthropic_version, String, api_name: :"anthropic-version"

      # @!parse
      #   # @return [String]
      #   attr_writer :anthropic_version

      # @!attribute [r] x_api_key
      #   Your unique API key for authentication.
      #
      #     This key is required in the header of all API requests, to authenticate your
      #     account and access Anthropic's services. Get your API key through the
      #     [Console](https://console.anthropic.com/settings/keys). Each key is scoped to a
      #     Workspace.
      #
      #   @return [String, nil]
      optional :x_api_key, String, api_name: :"x-api-key"

      # @!parse
      #   # @return [String]
      #   attr_writer :x_api_key

      # @!parse
      #   # @param max_tokens_to_sample [Integer]
      #   # @param model [String]
      #   # @param prompt [String]
      #   # @param metadata [Sam::Models::CompleteCreateParams::Metadata]
      #   # @param stop_sequences [Array<String>]
      #   # @param stream [Boolean]
      #   # @param temperature [Float]
      #   # @param top_k [Integer]
      #   # @param top_p [Float]
      #   # @param anthropic_version [String]
      #   # @param x_api_key [String]
      #   # @param request_options [Sam::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     max_tokens_to_sample:,
      #     model:,
      #     prompt:,
      #     metadata: nil,
      #     stop_sequences: nil,
      #     stream: nil,
      #     temperature: nil,
      #     top_k: nil,
      #     top_p: nil,
      #     anthropic_version: nil,
      #     x_api_key: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Sam::BaseModel) -> void

      class Metadata < Sam::BaseModel
        # @!attribute user_id
        #   An external identifier for the user who is associated with the request.
        #
        #     This should be a uuid, hash value, or other opaque identifier. Anthropic may use
        #     this id to help detect abuse. Do not include any identifying information such as
        #     name, email address, or phone number.
        #
        #   @return [String, nil]
        optional :user_id, String, nil?: true

        # @!parse
        #   # An object describing metadata about the request.
        #   #
        #   # @param user_id [String, nil]
        #   #
        #   def initialize(user_id: nil, **) = super

        # def initialize: (Hash | Sam::BaseModel) -> void
      end
    end
  end
end
