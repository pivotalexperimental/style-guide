module StyleGuide
  class Engine < ::Rails::Engine
    isolate_namespace StyleGuide
    class StyleGuideConfig < Struct.new(:partial_paths); end

    config.style_guide = StyleGuideConfig.new([])

    initializer "style_guide.set_up_variables", :before => :load_config_initializers do |app|
      app.config.style_guide.partial_paths << StyleGuide::Engine.root.join("app/views/style_guide/partials")
    end
  end
end
