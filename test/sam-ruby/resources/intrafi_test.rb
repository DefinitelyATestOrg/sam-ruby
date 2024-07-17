# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::IntrafiTest < Test::Unit::TestCase
  def setup
    @increase = SamRuby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end
end
