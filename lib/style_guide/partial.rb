module StyleGuide
  class Partial
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def id
      @id ||= title.downcase.gsub(/[^a-zA-Z0-9]+/, "_")
    end

    def title
      @title ||= File.basename(path, ".erb").titleize.strip
    end

    def content
      @content || File.read(path)
    end
  end
end
