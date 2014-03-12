module StyleGuide
  class ApplicationController < ActionController::Base

    protected

    def load_sections
      @sections = StyleGuide::Engine.config.style_guide.sections
    end


    #
    # Set the @application_css instance variable based on our config
    #
    # @return [String] Current application_css value
    def set_application_css
      @application_css = Rails.application.config.style_guide.application_css
    end
  end
end
