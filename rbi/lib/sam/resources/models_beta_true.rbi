# typed: strong

module Sam
  module Resources
    class ModelsBetaTrue
      sig do
        params(
          after_id: String,
          before_id: String,
          limit: Integer,
          anthropic_version: String,
          x_api_key: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::ModelsBetaTrueListResponse)
      end
      def list(
        after_id: nil,
        before_id: nil,
        limit: nil,
        anthropic_version: nil,
        x_api_key: nil,
        request_options: {}
      )
      end

      sig { params(client: Sam::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
