# typed: strong

module Sam
  class JsonLStream
    include Sam::BaseStream

    Message = type_member(:in) { {fixed: T.anything} }
    Elem = type_member(:out)

    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end
  end
end
