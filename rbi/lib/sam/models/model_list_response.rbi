# typed: strong

module Sam
  module Models
    class ModelListResponse < Sam::BaseModel
      sig { returns(T::Array[Sam::Models::ModelListResponse::Data]) }
      def data
      end

      sig do
        params(_: T::Array[Sam::Models::ModelListResponse::Data])
          .returns(T::Array[Sam::Models::ModelListResponse::Data])
      end
      def data=(_)
      end

      # First ID in the `data` list. Can be used as the `before_id` for the previous
      #   page.
      sig { returns(T.nilable(String)) }
      def first_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def first_id=(_)
      end

      # Indicates if there are more results in the requested page direction.
      sig { returns(T::Boolean) }
      def has_more
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def has_more=(_)
      end

      # Last ID in the `data` list. Can be used as the `after_id` for the next page.
      sig { returns(T.nilable(String)) }
      def last_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def last_id=(_)
      end

      sig do
        params(
          data: T::Array[T.any(Sam::Models::ModelListResponse::Data, Sam::Util::AnyHash)],
          first_id: T.nilable(String),
          has_more: T::Boolean,
          last_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(data:, first_id:, has_more:, last_id:)
      end

      sig do
        override
          .returns(
            {
              data: T::Array[Sam::Models::ModelListResponse::Data],
              first_id: T.nilable(String),
              has_more: T::Boolean,
              last_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      class Data < Sam::BaseModel
        # Unique model identifier.
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        # RFC 3339 datetime string representing the time at which the model was released.
        #   May be set to an epoch value if the release date is unknown.
        sig { returns(Time) }
        def created_at
        end

        sig { params(_: Time).returns(Time) }
        def created_at=(_)
        end

        # A human-readable name for the model.
        sig { returns(String) }
        def display_name
        end

        sig { params(_: String).returns(String) }
        def display_name=(_)
        end

        # Object type.
        #
        #   For Models, this is always `"model"`.
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(id: String, created_at: Time, display_name: String, type: Symbol).returns(T.attached_class)
        end
        def self.new(id:, created_at:, display_name:, type: :model)
        end

        sig { override.returns({id: String, created_at: Time, display_name: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
