# frozen_string_literal: true

module Sam
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |batch|
    #     puts(batch)
    #   end
    class JsonLStream
      include Sam::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
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
