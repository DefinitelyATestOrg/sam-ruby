# frozen_string_literal: true

module Sam
  module Internal
    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{Sam::Internal}::OMIT>" }
      end
        .freeze
  end
end
