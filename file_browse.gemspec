$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "file_browse/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "file_browse"
  s.version     = FileBrowse::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Howard"]
  s.email       = ["jared@howardpants.com"]
  s.homepage    = "http://github.com/jaredhoward/file_browse"
  s.summary     = "FileBrowse is a Rails Engine that browses the filesystem."
  s.description = "FileBrowse is a Rails Engine that browses the filesystem. It is coded for my applications. If it doesn't work for you, oh well."

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "jquery-rails", "~> 1.0.16"
end
