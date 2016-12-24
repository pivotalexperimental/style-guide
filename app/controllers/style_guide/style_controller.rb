module StyleGuide
  class StyleController < StyleGuide::ApplicationController
    before_action :load_sections

    def index
      @current_section = @sections.first
      render :show
    end

    def show
      @current_section = @sections.detect { |section| section.id == params[:id] }
    end
  end
end
