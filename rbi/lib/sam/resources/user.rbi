# typed: strong

module Sam
  module Resources
    class User
      sig do
        params(
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          username: String,
          user_status: Integer,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::UserAPI)
      end
      def create(
        id: nil,
        email: nil,
        first_name: nil,
        last_name: nil,
        password: nil,
        phone: nil,
        username: nil,
        user_status: nil,
        request_options: {}
      )
      end

      sig do
        params(
          username: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::UserAPI)
      end
      def retrieve(username, request_options: {})
      end

      sig do
        params(
          path_username: String,
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          body_username: String,
          user_status: Integer,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .void
      end
      def update(
        path_username,
        id: nil,
        email: nil,
        first_name: nil,
        last_name: nil,
        password: nil,
        phone: nil,
        body_username: nil,
        user_status: nil,
        request_options: {}
      )
      end

      sig do
        params(
          username: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .void
      end
      def delete(username, request_options: {})
      end

      sig do
        params(
          body: T::Array[Sam::Models::UserAPI],
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Sam::Models::UserAPI)
      end
      def create_list(body: nil, request_options: {})
      end

      sig do
        params(
          password: String,
          username: String,
          request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(String)
      end
      def login(password: nil, username: nil, request_options: {})
      end

      sig { params(request_options: T.nilable(T.any(Sam::RequestOptions, T::Hash[Symbol, T.anything]))).void }
      def logout(request_options: {})
      end

      sig { params(client: Sam::Client).void }
      def initialize(client:)
      end
    end
  end
end
