# frozen_string_literal: true

require_relative "../test_helper"

class Sam::Test::Resources::StoreTest < Minitest::Test
  parallelize_me!

  def setup
    @sam = Sam::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end
end
