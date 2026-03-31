# typed: strong

module Sam
  module Models
    class ModelsBetaTrueListResponse < Sam::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sam::Models::ModelsBetaTrueListResponse, Sam::Internal::AnyHash)
        end

      sig { returns(T::Array[Sam::Models::ModelsBetaTrueListResponse::Data]) }
      attr_accessor :data

      # First ID in the `data` list. Can be used as the `before_id` for the previous
      # page.
      sig { returns(T.nilable(String)) }
      attr_accessor :first_id

      # Indicates if there are more results in the requested page direction.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Last ID in the `data` list. Can be used as the `after_id` for the next page.
      sig { returns(T.nilable(String)) }
      attr_accessor :last_id

      sig do
        params(
          data: T::Array[Sam::Models::ModelsBetaTrueListResponse::Data::OrHash],
          first_id: T.nilable(String),
          has_more: T::Boolean,
          last_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # First ID in the `data` list. Can be used as the `before_id` for the previous
        # page.
        first_id:,
        # Indicates if there are more results in the requested page direction.
        has_more:,
        # Last ID in the `data` list. Can be used as the `after_id` for the next page.
        last_id:
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[Sam::Models::ModelsBetaTrueListResponse::Data],
            first_id: T.nilable(String),
            has_more: T::Boolean,
            last_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Data < Sam::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sam::Models::ModelsBetaTrueListResponse::Data,
              Sam::Internal::AnyHash
            )
          end

        # Unique model identifier.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string representing the time at which the model was released.
        # May be set to an epoch value if the release date is unknown.
        sig { returns(Time) }
        attr_accessor :created_at

        # A human-readable name for the model.
        sig { returns(String) }
        attr_accessor :display_name

        # Object type.
        #
        # For Models, this is always `"model"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created_at: Time,
            display_name: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique model identifier.
          id:,
          # RFC 3339 datetime string representing the time at which the model was released.
          # May be set to an epoch value if the release date is unknown.
          created_at:,
          # A human-readable name for the model.
          display_name:,
          # Object type.
          #
          # For Models, this is always `"model"`.
          type: :model
        )
        end

        sig do
          override.returns(
            { id: String, created_at: Time, display_name: String, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
