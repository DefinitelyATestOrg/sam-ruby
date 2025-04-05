# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::ModelsBetaTrueTest < Sam::Test::ResourceTest
  def test_list
    response = @sam.models_beta_true.list

    assert_pattern do
      response => Sam::Models::ModelsBetaTrueListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sam::Internal::Type::ArrayOf[Sam::Models::ModelsBetaTrueListResponse::Data]),
        first_id: String | nil,
        has_more: Sam::Internal::Type::Boolean,
        last_id: String | nil
      }
    end
  end
end
