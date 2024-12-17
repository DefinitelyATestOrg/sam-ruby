# frozen_string_literal: true

require_relative "test_helper"

class Sam::Test::BaseClientTest < Minitest::Test
  def test_from_uri_string
    assert_equal(
      URI.parse("h://a.b/c?d=e"),
      Sam::BaseClient.new(
        base_url: "h://nope/ignored"
      ).resolve_url(
        Sam::Util.parse_uri("h://a.b/c?d=e")
      )
    )
  end

  def test_extra_query
    assert_equal(
      URI.parse("h://a.b/c?d=e&f=g"),
      Sam::BaseClient.new(
        base_url: "h://nope"
      ).resolve_url(
        host: "a.b",
        path: "/c",
        query: {"d" => ["e"]},
        extra_query: {
          "f" => ["g"]
        }
      )
    )
  end

  def test_path_merged
    base_url = "h://a.b/c?d=e"
    cases = {
      "c2" => URI.parse("h://a.b/c/c2"),
      "/c2?f=g" => URI.parse("h://a.b/c2?f=g"),
      "/c?f=g" => URI.parse("h://a.b/c?d=e&f=g")
    }

    cases.each do |path, expected|
      assert_equal(
        expected,
        Sam::BaseClient.new(
          base_url: base_url
        ).resolve_url(
          path: path
        )
      )
    end
  end
end