# typed: strong

module Sam
  module Models
    module Messages
      class BatchCancelParams < Sam::BaseModel
        extend Sam::RequestParameters::Converter
        include Sam::RequestParameters

        sig { returns(T.nilable(T::Array[String])) }
        def anthropic_beta
        end

        sig { params(_: T::Array[String]).returns(T::Array[String]) }
        def anthropic_beta=(_)
        end

        sig { returns(T.nilable(String)) }
        def anthropic_version
        end

        sig { params(_: String).returns(String) }
        def anthropic_version=(_)
        end

        sig { returns(T.nilable(String)) }
        def x_api_key
        end

        sig { params(_: String).returns(String) }
        def x_api_key=(_)
        end

        sig do
          params(
            anthropic_beta: T::Array[String],
            anthropic_version: String,
            x_api_key: String,
            request_options: T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything])
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
