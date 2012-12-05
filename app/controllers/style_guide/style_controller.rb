module StyleGuide
  class StyleController < StyleGuide::ApplicationController
    before_filter :load_sections

    def index
      @active = @sections.first
      render :show
    end

    def show
      p params[:id]
      p @sections.map(&:id)
      @active = @sections.detect { |section| section.id == params[:id] }
      p @active
    end
  end
end
