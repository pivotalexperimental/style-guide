module StyleGuide
  class Config
    attr_reader :paths

    def self.bootstrap_glob
      StyleGuide::Engine.root.join("app", "views", "bootstrap", "*")
    end

    def initialize(options = {})
      @paths = options[:paths] || [self.class.bootstrap_glob]
    end

    def paths=(paths)
      if paths.is_a?(Array)
        @paths = paths
      else
        @paths = [paths]
      end
    end

    def sections
      StyleGuide::Section.from_paths(expanded_paths)
    end

    private

    def expanded_paths
      globbed_paths.flatten.uniq.select(&:directory?)
    end

    def globbed_paths
      paths.map { |path| Pathname.glob(path) }
    end
  end
end
