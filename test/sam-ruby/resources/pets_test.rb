# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::PetsTest < Minitest::Test
  parallelize_me!

  def setup
    @sam = SamRuby::Client.new(base_url: "http://localhost:4010")
  end

  def test_create
    response = @sam.pets.create(0)
    assert_nil(response)
  end

  def test_retrieve
    response = @sam.pets.retrieve(0)
    assert_kind_of(SamRuby::Models::Pet, response)
  end

  def test_update_required_params
    response = @sam.pets.update({name: "doggie", photoUrls: %w[string string string]})
    assert_kind_of(SamRuby::Models::Pet, response)
  end

  def test_delete
    response = @sam.pets.delete(0)
    assert_nil(response)
  end

  def test_find_by_status
    response = @sam.pets.find_by_status
    assert_kind_of(Array, response)
  end

  def test_find_by_tags
    response = @sam.pets.find_by_tags
    assert_kind_of(Array, response)
  end

  def test_upload_image_required_params
    response = @sam.pets.upload_image(0, {body: [StringIO.new("some file contents"), {filename: "file.txt"}]})
    assert_kind_of(SamRuby::Models::APIResponse, response)
  end
end
