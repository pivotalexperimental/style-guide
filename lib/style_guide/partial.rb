module StyleGuide
  class Partial
    attr_reader :path, :section

    def initialize(path, section)
      @path = path
      @section = section
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

    def description
      I18n.translate!(id, :scope => [:style_guide, section.id.to_sym])
    rescue I18n::MissingTranslationData
      nil
    end
  end
end
