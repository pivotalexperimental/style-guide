module StyleGuide
  class StyleController < StyleGuide::ApplicationController
    before_filter :load_sections

    def index
      @current_section = @sections.first
      render :show
    end

    def show
      @current_section = @sections.detect { |section| section.id == params[:id] }
      # binding.pry
      # @formatted_partials = @current_section.partials.map do |partial|
      #   doc = Nokogiri.XML(partial) do |config|
      #     config.default_xml.noblanks
      #   end
      #   doc.to_xml(:indent => 2)
      # end
    end
  end
end
