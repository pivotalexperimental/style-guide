module StyleGuide
  class Config
    attr_reader :partial_paths

    def self.style_guide_views_path
      StyleGuide::Engine.root.join("app", "views", "style_guide")
    end

    def self.style_guide_views_directories
      style_guide_views_path.children.select(&:directory?).reject { |d| d.basename.to_s == "style" }
    end

    def initialize(options = {})
      @partial_paths = options[:partial_paths] || self.class.style_guide_views_directories
    end

    def partial_paths=(paths)
      if paths.is_a?(Array)
        @partial_paths = paths
      else
        @partial_paths = [paths]
      end
    end
  end
end
