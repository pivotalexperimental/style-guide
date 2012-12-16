require "style_guide/partial"

module StyleGuide
  class Section
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def id
      @id ||= File.basename(path).downcase.gsub(/[^a-zA-Z0-9]/, " ").strip.gsub(/\s+/, "_")
    end

    def title
      @title ||= File.basename(path).titleize
    end

    def partials
      partial_paths.map { |path| StyleGuide::Partial.new(path, self) }.sort_by { |p| p.title }
    end

    private

    def partial_paths
      @partial_paths ||= Dir.glob(File.expand_path("**/_*.erb", path))
    end
  end
end
