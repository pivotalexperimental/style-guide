require "rails/engine"
require "style_guide/config"

module StyleGuide
  class Engine < ::Rails::Engine
    isolate_namespace StyleGuide
    config.style_guide = StyleGuide::Config.new
  end
end
