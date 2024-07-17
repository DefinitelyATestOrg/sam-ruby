# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::EntitiesTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @increase.entities.create({structure: "corporation"})
    assert_kind_of(SamRuby::Models::Entity, response)
  end

  def test_retrieve
    response = @increase.entities.retrieve("entity_id")
    assert_kind_of(SamRuby::Models::Entity, response)
  end

  def test_list
    response = @increase.entities.list 
    assert_kind_of(SamRuby::Page, response)
  end

  def test_archive
    response = @increase.entities.archive("entity_id")
    assert_kind_of(SamRuby::Models::Entity, response)
  end

  def test_confirm
    response = @increase.entities.confirm("entity_id")
    assert_kind_of(SamRuby::Models::Entity, response)
  end

  def test_update_address_required_params
    response = @increase.entities.update_address(
      "entity_id",
      {address: {"city" => "New York", "line1" => "33 Liberty Street", "state" => "NY", "zip" => "10045"}}
    )
    assert_kind_of(SamRuby::Models::Entity, response)
  end
end