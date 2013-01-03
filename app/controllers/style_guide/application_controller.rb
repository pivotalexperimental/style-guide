module StyleGuide
  class ApplicationController < ActionController::Base
    def load_sections
      @sections = StyleGuide::Engine.config.style_guide.sections
    end
  end
end
