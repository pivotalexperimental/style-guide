module StyleGuide
  class StyleController < StyleGuide::ApplicationController
    def index
      @partials = []
      StyleGuide::Engine.config.style_guide.partial_paths.each do |path|
        Dir.glob(File.expand_path("_*.erb", path)) do |partial|
          @partials << partial
        end
      end
    end
  end
end
