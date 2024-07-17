# frozen_string_literal: true

module SamRuby
  module Models
    class InboundMailItemList < BaseModel
      # @!attribute [rw] data
      #   The contents of the list.
      #   @return [Array<SamRuby::Models::InboundMailItem>]
      required :data, SamRuby::ArrayOf.new(-> { SamRuby::Models::InboundMailItem })

      # @!attribute [rw] next_cursor
      #   A pointer to a place in the list.
      #   @return [String]
      required :next_cursor, String
    end
  end
end
