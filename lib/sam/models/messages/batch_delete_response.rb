# frozen_string_literal: true

module Sam
  module Models
    module Messages
      class BatchDeleteResponse < Sam::BaseModel
        # @!attribute id
        #   ID of the Message Batch.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   Deleted object type.
        #
        #     For Message Batches, this is always `"message_batch_deleted"`.
        #
        #   @return [Symbol, :message_batch_deleted]
        required :type, const: :message_batch_deleted

        # @!parse
        #   # @param id [String]
        #   # @param type [Symbol, :message_batch_deleted]
        #   #
        #   def initialize(id:, type: :message_batch_deleted, **) = super

        # def initialize: (Hash | Sam::BaseModel) -> void
      end
    end
  end
end
