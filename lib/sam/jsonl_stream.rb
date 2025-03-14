# frozen_string_literal: true

module Sam
  # @api private
  #
  # @example
  # ```ruby
  # stream.for_each do |event|
  #   puts(event)
  # end
  # ```
  #
  # @example
  # ```ruby
  # events = stream.to_enum.take(2)
  #
  # events => Array
  # ```
  class JsonLStream
    include Sam::BaseStream

    # @api private
    #
    # @return [Enumerable]
    private def iterator
      @iterator ||= Sam::Util.chain_fused(@messages) do |y|
        @messages.each do
          y << Sam::Converter.coerce(@model, _1)
        end
      end
    end
  end
end
