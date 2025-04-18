# frozen_string_literal: true

module Sam
  module Models
    module Messages
      # @see Sam::Resources::Messages::Batches#delete
      class BatchDeleteResponse < Sam::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the Message Batch.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   Deleted object type.
        #
        #   For Message Batches, this is always `"message_batch_deleted"`.
        #
        #   @return [Symbol, :message_batch_deleted]
        required :type, const: :message_batch_deleted

        # @!method initialize(id:, type: :message_batch_deleted)
        #   @param id [String]
        #   @param type [Symbol, :message_batch_deleted]
      end
    end
  end
end
