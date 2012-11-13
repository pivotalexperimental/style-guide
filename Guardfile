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
