# frozen_string_literal: true

module Sam
  # @private
  #
  class JsonLStream < Sam::BaseStream
    # @private
    #
    # @return [Enumerable]
    #
    private def iterator
      @iterator ||= Sam::Util.chain_fused(@messages) do |y|
        @messages.each do |line|
          decoded = JSON.parse(line, symbolize_names: true)
          y << Sam::Converter.coerce(@model, decoded)
        end
      end
    end
  end
end
