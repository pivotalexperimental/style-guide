require "rails/generators"

module StyleGuide
  class InstallGenerator < ::Rails::Generators::Base
    desc "Style Guide installation generator"
    def install
      ensure_rack_livereload
      ensure_guard_livereload
      configure_guard_livereload
      configure_application
      configure_development
      mount_style_guide
    end

    no_tasks do
      def guardfile
        @guardfile ||= if File.exists?(guardfile_path)
          File.open(guardfile_path).read
        end
      end

      def application_rb
        @application_rb ||= File.open(application_rb_path).read
      end

      def development_rb
        @development_rb ||= File.open(development_rb_path).read
      end

      def routes_rb
        @development_rb ||= File.open(routes_rb_path).read
      end

      def default_partial_path
        'Rails.root.join("app/views/style-guide/**/*")'
      end
    end

    private

    def guardfile_path
      Rails.root.join("Guardfile")
    end

    def application_rb_path
      Rails.root.join("config", "application.rb")
    end

    def development_rb_path
      Rails.root.join("config", "environments", "development.rb")
    end

    def routes_rb_path
      Rails.root.join("config", "routes.rb")
    end

    def ensure_rack_livereload
      Rack.const_get("LiveReload")
    rescue NameError
      gem "rack-livereload", :group => "development"
    end

    def ensure_guard_livereload
      Guard.const_get("LiveReload")
    rescue NameError
      gem "guard-livereload", :group => "development"
    end

    def configure_guard_livereload
      unless guardfile && guardfile.include?("guard 'livereload'")
        system("guard init livereload")
      end
    end

    def configure_application
      unless application_rb && application_rb.include?("config.style_guide.partial_paths")
        application("config.style_guide.partial_paths << #{default_partial_path}")
      end
    end

    def configure_development
      unless development_rb && development_rb.include?("Rack::LiveReload")
        application("config.middleware.insert_before(::Rack::Lock, ::Rack::LiveReload, :min_delay => 500)", :env => "development")
      end
    end

    def mount_style_guide
      unless routes_rb && routes_rb.include?("mount StyleGuide::Engine")
        route(%(mount StyleGuide::Engine => "/style-guide"))
      end
    end
  end
end
