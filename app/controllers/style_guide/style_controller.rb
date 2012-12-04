module StyleGuide
  class StyleController < StyleGuide::ApplicationController
    before_filter :load_sections

    def index
      @active = @sections.first
    end
  end
end
