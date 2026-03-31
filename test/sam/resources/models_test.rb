# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::ModelsTest < Sam::Test::ResourceTest
  def test_retrieve
    response = @sam.models.retrieve("model_id")

    assert_pattern do
      response => Sam::Models::ModelRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        type: Symbol
      }
    end
  end

  def test_list
    response = @sam.models.list

    assert_pattern do
      response => Sam::Models::ModelListResponse
    end

    assert_pattern do
      response => {
        data: ^(Sam::Internal::Type::ArrayOf[Sam::Models::ModelListResponse::Data]),
        first_id: String | nil,
        has_more: Sam::Internal::Type::Boolean,
        last_id: String | nil
      }
    end
  end

  def test_retrieve_beta
    response = @sam.models.retrieve_beta("model_id")

    assert_pattern do
      response => Sam::Models::ModelRetrieveBetaResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        display_name: String,
        type: Symbol
      }
    end
  end
end
