ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require "tmpdir"
require "rspec/rails"
require "generators/style_guide/install_generator"

Dir.glob(File.expand_path("../support/**/*.rb")).each {|f| require f }
