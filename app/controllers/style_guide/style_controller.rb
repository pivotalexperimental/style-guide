module StyleGuide
  class StyleController < StyleGuide::ApplicationController
    before_filter :load_sections

    def index
      @active = @sections.first
      render :show
    end

    def show
      @active = @sections.detect { |section| section.id == params[:id] }
    end
  end
end
