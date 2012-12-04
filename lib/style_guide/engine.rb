require "rails/engine"
require "style_guide/config"
require "style_guide/section"

module StyleGuide
  class Engine < ::Rails::Engine
    isolate_namespace StyleGuide
    config.style_guide = StyleGuide::Config.new
  end
end
