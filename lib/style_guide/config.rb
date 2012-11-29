module StyleGuide
  class Config
    attr_accessor :partial_paths

    def initialize(options = {})
      @partial_paths = options[:partial_paths] || [StyleGuide::Engine.root.join("app/views/style_guide/partials")]
    end
  end
end
