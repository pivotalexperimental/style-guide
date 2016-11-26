ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require "tmpdir"
require "rspec/rails"
require "generators/style_guide/install_generator"

RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :should, :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end
end

Dir.glob(File.expand_path("../support/**/*.rb")).each {|f| require f }
