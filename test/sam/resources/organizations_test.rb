# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::OrganizationsTest < Test::Unit::TestCase
  def setup
    @sam = Sam::Client.new(base_url: "http://localhost:4010", auth_token: "My Auth Token")
  end

  def test_update_required_params
    response = @sam.organizations.update({id: "string", friendlyId: "string", name: "string"})
    refute_nil(Object, response)
  end
end
