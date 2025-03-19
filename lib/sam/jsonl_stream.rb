# frozen_string_literal: true

module Sam
  # @example
  # ```ruby
  # stream.each do |batch|
  #   puts(batch)
  # end
  # ```
  #
  # @example
  # ```ruby
  # batches =
  #   stream
  #   .lazy
  #   .select { _1.object_id.even? }
  #   .map(&:itself)
  #   .take(2)
  #   .to_a
  #
  # batches => Array
  # ```
  class JsonLStream
    include Sam::BaseStream

    # @api private
    #
    # @return [Enumerable]
    private def iterator
      @iterator ||= Sam::Util.chain_fused(@stream) do |y|
        @stream.each do
          y << Sam::Converter.coerce(@model, _1)
        end
      end
    end
  end
end
