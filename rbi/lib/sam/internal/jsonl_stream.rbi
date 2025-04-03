# typed: strong

module Sam
  module Internal
    class JsonLStream
      include Sam::Internal::Type::BaseStream

      Message = type_member(:in) { {fixed: T.anything} }
      Elem = type_member(:out)

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
