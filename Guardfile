#!/usr/bin/env ruby

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'livereload' do
  watch(%r{(app|spec/dummy/app)/views/.+\.(erb|haml|slim)$})
  watch(%r{(app|spec/dummy/app)/helpers/.+\.rb})
  watch(%r{(public|spec/dummy/public)/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  watch(%r{(app|vendor|spec/dummy/app)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end

guard 'rspec', :cli => '--fail-fast --tag ~@slow:true' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
