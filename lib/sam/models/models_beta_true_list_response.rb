# frozen_string_literal: true

module Sam
  module Models
    # @see Sam::Resources::ModelsBetaTrue#list
    class ModelsBetaTrueListResponse < Sam::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<Sam::Models::ModelsBetaTrueListResponse::Data>]
      required :data, -> { Sam::Internal::Type::ArrayOf[Sam::Models::ModelsBetaTrueListResponse::Data] }

      # @!attribute first_id
      #   First ID in the `data` list. Can be used as the `before_id` for the previous
      #   page.
      #
      #   @return [String, nil]
      required :first_id, String, nil?: true

      # @!attribute has_more
      #   Indicates if there are more results in the requested page direction.
      #
      #   @return [Boolean]
      required :has_more, Sam::Internal::Type::Boolean

      # @!attribute last_id
      #   Last ID in the `data` list. Can be used as the `after_id` for the next page.
      #
      #   @return [String, nil]
      required :last_id, String, nil?: true

      # @!method initialize(data:, first_id:, has_more:, last_id:)
      #   Some parameter documentations has been truncated, see
      #   {Sam::Models::ModelsBetaTrueListResponse} for more details.
      #
      #   @param data [Array<Sam::Models::ModelsBetaTrueListResponse::Data>]
      #
      #   @param first_id [String, nil] First ID in the `data` list. Can be used as the `before_id` for the previous pag
      #
      #   @param has_more [Boolean] Indicates if there are more results in the requested page direction.
      #
      #   @param last_id [String, nil] Last ID in the `data` list. Can be used as the `after_id` for the next page.

      class Data < Sam::Internal::Type::BaseModel
        # @!attribute id
        #   Unique model identifier.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   RFC 3339 datetime string representing the time at which the model was released.
        #   May be set to an epoch value if the release date is unknown.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute display_name
        #   A human-readable name for the model.
        #
        #   @return [String]
        required :display_name, String

        # @!attribute type
        #   Object type.
        #
        #   For Models, this is always `"model"`.
        #
        #   @return [Symbol, :model]
        required :type, const: :model

        # @!method initialize(id:, created_at:, display_name:, type: :model)
        #   Some parameter documentations has been truncated, see
        #   {Sam::Models::ModelsBetaTrueListResponse::Data} for more details.
        #
        #   @param id [String] Unique model identifier.
        #
        #   @param created_at [Time] RFC 3339 datetime string representing the time at which the model was released.
        #
        #   @param display_name [String] A human-readable name for the model.
        #
        #   @param type [Symbol, :model] Object type.
      end
    end
  end
end
