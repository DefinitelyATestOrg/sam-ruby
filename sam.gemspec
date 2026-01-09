# frozen_string_literal: true

require_relative "lib/sam/version"

Gem::Specification.new do |s|
  s.name = "sam"
  s.version = Sam::VERSION
  s.summary = "Ruby library to access the Sam API"
  s.authors = ["Sam"]
  s.email = "apiteam@swagger.io"
  s.homepage = "https://gemdocs.org/gems/sam"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/DefinitelyATestOrg/sam-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
