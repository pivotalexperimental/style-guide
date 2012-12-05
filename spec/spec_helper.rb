ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require "tmpdir"
require "rspec/rails"
# ENGINE_RAILS_ROOT = File.expand_path("../..", __FILE__)
Dir.glob(File.expand_path("../support/**/*.rb")).each {|f| require f }
