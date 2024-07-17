# frozen_string_literal: true

module SamRuby
  module Models
    class LockboxList < BaseModel
      # @!attribute [rw] data
      #   The contents of the list.
      #   @return [Array<SamRuby::Models::Lockbox>]
      required :data, SamRuby::ArrayOf.new(-> { SamRuby::Models::Lockbox })

      # @!attribute [rw] next_cursor
      #   A pointer to a place in the list.
      #   @return [String]
      required :next_cursor, String
    end
  end
end
