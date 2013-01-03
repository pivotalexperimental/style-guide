module StyleGuide
  class Config
    attr_reader :partial_paths

    def self.bootstrap_path
      StyleGuide::Engine.root.join("app", "views", "bootstrap")
    end

    def initialize(options = {})
      @paths = options[:paths] || [self.class.bootstrap_path]
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
