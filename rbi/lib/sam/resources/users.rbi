# typed: strong

module Sam
  module Resources
    class Users
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
          request_options: Sam::RequestOpts
        ).returns(Sam::Models::User)
      end
      def create(
        id:,
        email:,
        first_name:,
        last_name:,
        password:,
        phone:,
        username:,
        user_status:,
        request_options: {}
      )
      end

      sig { params(username: String, request_options: Sam::RequestOpts).returns(Sam::Models::User) }
      def retrieve(username, request_options: {}); end

      sig do
        params(
          username_1: String,
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          username_2: String,
          user_status: Integer,
          request_options: Sam::RequestOpts
        ).void
      end
      def update(
        username_1,
        id:,
        email:,
        first_name:,
        last_name:,
        password:,
        phone:,
        username_2:,
        user_status:,
        request_options: {}
      ); end

      sig { params(username: String, request_options: Sam::RequestOpts).void }
      def delete(username, request_options: {}); end

      sig do
        params(
          params: T.any(Sam::Models::UserCreateWithListParams, T::Hash[Symbol, T.anything]),
          body: T::Array[Sam::Models::User],
          request_options: Sam::RequestOpts
        ).returns(Sam::Models::User)
      end
      def create_with_list(params, body:, request_options: {}); end

      sig { params(password: String, username: String, request_options: Sam::RequestOpts).returns(String) }
      def login(password:, username:, request_options: {}); end

      sig { params(request_options: Sam::RequestOpts).void }
      def logout(request_options: {}); end

      sig { params(client: Sam::Client).void }
      def initialize(client:); end
    end
  end
end
