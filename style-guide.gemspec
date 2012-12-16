$:.push File.expand_path("../lib", __FILE__)
require "style_guide/version"

Gem::Specification.new do |s|
  s.name        = "style-guide"
  s.version     = StyleGuide::VERSION
  s.authors     = ["Doc Ritezel"]
  s.email       = ["doc@pivotallabs.com"]
  s.homepage    = "https://github.com/pivotal/style-guide"
  s.summary     = "A live style guide for your application."
  s.description = "Inspired by the Bootstrap guide, style-guide is an engine that lets you see all your styles applied live."

  s.files         = `git ls-files`.split( "\n" )
  s.test_files    = `git ls-files -- spec/*`.split( "\n" )
  s.require_paths = ['lib']

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "jquery-rails", "~> 2.1"
  s.add_dependency "nokogiri", "~> 1.5"

  s.add_development_dependency "libv8"
  s.add_development_dependency "therubyracer"

  s.add_development_dependency "foreman"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency "guard-livereload"
  s.add_development_dependency "terminal-notifier-guard"
end
