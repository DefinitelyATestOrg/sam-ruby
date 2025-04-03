# frozen_string_literal: true

module Sam
  module Internal
    # @example
    #   stream.each do |batch|
    #     puts(batch)
    #   end
    #
    # @example
    #   batches =
    #     stream
    #     .lazy
    #     .select { _1.object_id.even? }
    #     .map(&:itself)
    #     .take(2)
    #     .to_a
    #
    #   batches => Array
    class JsonLStream
      include Sam::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable]
      private def iterator
        @iterator ||= Sam::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do
            y << Sam::Internal::Type::Converter.coerce(@model, _1)
          end
        end
      end
    end
  end
end
