# typed: strong

module Sam
  module Models
    class UserAPI < Sam::BaseModel
      sig { returns(T.nilable(Integer)) }
      def id
      end

      sig { params(_: Integer).returns(Integer) }
      def id=(_)
      end

      sig { returns(T.nilable(String)) }
      def email
      end

      sig { params(_: String).returns(String) }
      def email=(_)
      end

      sig { returns(T.nilable(String)) }
      def first_name
      end

      sig { params(_: String).returns(String) }
      def first_name=(_)
      end

      sig { returns(T.nilable(String)) }
      def last_name
      end

      sig { params(_: String).returns(String) }
      def last_name=(_)
      end

      sig { returns(T.nilable(String)) }
      def password
      end

      sig { params(_: String).returns(String) }
      def password=(_)
      end

      sig { returns(T.nilable(String)) }
      def phone
      end

      sig { params(_: String).returns(String) }
      def phone=(_)
      end

      sig { returns(T.nilable(String)) }
      def username
      end

      sig { params(_: String).returns(String) }
      def username=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def user_status
      end

      sig { params(_: Integer).returns(Integer) }
      def user_status=(_)
      end

      sig do
        params(
          id: Integer,
          email: String,
          first_name: String,
          last_name: String,
          password: String,
          phone: String,
          username: String,
          user_status: Integer
        )
          .returns(T.attached_class)
      end
      def self.new(
        id: nil,
        email: nil,
        first_name: nil,
        last_name: nil,
        password: nil,
        phone: nil,
        username: nil,
        user_status: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: Integer,
              email: String,
              first_name: String,
              last_name: String,
              password: String,
              phone: String,
              username: String,
              user_status: Integer
            }
          )
      end
      def to_hash
      end
    end
  end
end
