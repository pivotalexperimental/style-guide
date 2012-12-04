module StyleGuide
  class ApplicationController < ActionController::Base
    def load_sections
      @sections =
        StyleGuide::Engine.config.style_guide.partial_paths.map do |path|
          StyleGuide::Section.new(path)
        end
    end
  end
end
