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
          path_username: String,
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          body_username: String,
          user_status: Integer,
          request_options: Sam::RequestOpts
        ).void
      end
      def update(
        path_username,
        id:,
        email:,
        first_name:,
        last_name:,
        password:,
        phone:,
        body_username:,
        user_status:,
        request_options: {}
      ); end

      sig { params(username: String, request_options: Sam::RequestOpts).void }
      def delete(username, request_options: {}); end

      sig do
        params(
          body: T::Array[Sam::Models::User],
          request_options: Sam::RequestOpts
        ).returns(Sam::Models::User)
      end
      def create_with_list(body:, request_options: {}); end

      sig { params(password: String, username: String, request_options: Sam::RequestOpts).returns(String) }
      def login(password:, username:, request_options: {}); end

      sig { params(request_options: Sam::RequestOpts).void }
      def logout(request_options: {}); end

      sig { params(client: Sam::Client).void }
      def initialize(client:); end
    end
  end
end
