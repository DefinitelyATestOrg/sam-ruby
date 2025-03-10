# typed: strong

module Sam
  class JsonLStream < Sam::BaseStream
    Elem = type_member(:out)

    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end
  end
end
