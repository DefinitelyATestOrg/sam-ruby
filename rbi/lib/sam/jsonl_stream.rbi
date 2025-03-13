# typed: strong

module Sam
  class JsonLStream
    include Sam::BaseStream

    Message = type_member(:in) { {fixed: T.anything} }
    Elem = type_member(:out)

    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end

    sig do
      params(
        model: T.any(T::Class[T.anything], Sam::Converter),
        url: URI::Generic,
        status: Integer,
        response: Net::HTTPResponse,
        messages: T::Enumerable[T.anything]
      )
        .returns(T.attached_class)
    end
    def self.new(model:, url:, status:, response:, messages:)
    end
  end
end
