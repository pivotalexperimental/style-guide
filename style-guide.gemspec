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

  s.add_dependency "rails"

  s.add_development_dependency "less"
  s.add_development_dependency "therubyracer"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-bundler"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-livereload"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "terminal-notifier-guard"
end
