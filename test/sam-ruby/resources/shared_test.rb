# frozen_string_literal: true

require_relative "../test_helper"

class SamRuby::Test::Resources::SharedTest < Minitest::Test
  parallelize_me!

  def setup
    @sam = SamRuby::Client.new(base_url: "http://localhost:4010")
  end
end
