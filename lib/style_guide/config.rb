module StyleGuide
  class Config
    attr_reader :partial_paths

    def self.bootstrap_glob
      StyleGuide::Engine.root.join("app", "views", "bootstrap", "*")
    end

    def initialize(options = {})
      @paths = options[:paths] || [self.class.bootstrap_glob]
    end

    def partial_paths=(paths)
      if paths.is_a?(Array)
        @partial_paths = paths
      else
        @partial_paths = [paths]
      end
    end

    def sections
      expanded_paths.map { |path| StyleGuide::Section.new(path) }
    end

    private

    def expanded_paths
      globbed_paths.flatten.uniq.select(&:directory?)
    end

    def globbed_paths
      partial_paths.map { |path| Pathname.glob(path) }
    end
  end
end
