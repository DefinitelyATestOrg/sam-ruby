# frozen_string_literal: true

require_relative "lib/sam/version"

Gem::Specification.new do |s|
  s.name = "sam"
  s.version = Sam::VERSION
  s.summary = "Ruby library to access the Sam API"
  s.authors = ["Sam"]
  s.email = "apiteam@swagger.io"
  s.files = Dir["lib/**/*.rb"]
  s.extra_rdoc_files = ["README.md"]
  s.required_ruby_version = ">= 3.0.0"
  s.add_dependency "connection_pool"
  s.homepage = "https://gemdocs.org/gems/sam/latest"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/DefinitelyATestOrg/sam-ruby"
  s.metadata["rubygems_mfa_required"] = "true"
end
