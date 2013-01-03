require "style_guide/partial"

module StyleGuide
  class Section
    attr_reader :path, :id

    def self.id_from_path(path)
      File.basename(path).downcase.gsub(/[^a-zA-Z0-9]/, " ").strip.gsub(/\s+/, "_")
    end

    def self.from_paths(paths)
      [*paths].reduce({}) do |sections, path|
        id = id_from_path(path)
        section = sections[id] ||= []
        section << new("#{id}#{section.empty? ? '' : section.count}", path)
        sections
      end.values.flatten
    end

    def initialize(id, path)
      @id = id
      @path = path
    end

    def title
      @title ||= File.basename(path).titleize
    end

    def partials
      partial_paths.map { |path| StyleGuide::Partial.new(path, self) }.sort_by { |p| p.title }
    end

    private

    def partial_paths
      @partial_paths ||= Dir.glob(File.expand_path("_*", path))
    end
  end
end
