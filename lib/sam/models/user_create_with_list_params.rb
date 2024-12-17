# frozen_string_literal: true

module Sam
  module Models
    class UserCreateWithListParams < Sam::BaseModel
      # @!attribute body
      #
      #   @return [Array<Sam::Models::User>]
      required :body, Sam::ArrayOf.new(-> { Sam::Models::User })

      # @!parse
      #   # @param body [Array<Sam::Models::User>]
      #   #
      #   def initialize(body:) = super

      # def initialize: (Hash | Sam::BaseModel) -> void
    end
  end
end
