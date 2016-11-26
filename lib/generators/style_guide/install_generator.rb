require "rails/generators"

module StyleGuide
  class InstallGenerator < ::Rails::Generators::Base
    desc "Style Guide installation generator"
    def install
      should_bundle = ensure_rack_livereload.nil?
      should_bundle = ensure_guard_livereload.nil? || should_bundle
      bundle_command("install") if should_bundle

      configure_guard_livereload
      configure_application
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
        @routes_rb ||= File.open(routes_rb_path).read
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
      nil
    end

    def ensure_guard_livereload
      Guard.const_get("LiveReload")
    rescue NameError
      gem "guard-livereload", :group => "development"
      nil
    end

    def bundle_command(command)
      say_status :run, "bundle #{command}"

      Dir.chdir(Rails.root) do
        oldrubyopt = ENV["RUBYOPT"]
        ENV["RUBYOPT"] = nil
        system("#{Gem.bin_path('bundler', 'bundle')} #{command}")
        ENV["RUBYOPT"] = oldrubyopt
      end
    end

    def configure_guard_livereload
      unless guardfile && guardfile.include?("guard 'livereload'")
        bundle_command("exec guard init livereload")
      end
    end

    def configure_application
      unless application_rb && application_rb.include?("config.style_guide.paths")
        application("StyleGuide::Engine.config.style_guide.paths << #{default_partial_path}")
      end
    end

    def mount_style_guide
      unless routes_rb && routes_rb.include?("mount StyleGuide::Engine")
        route(%(mount StyleGuide::Engine, at: "/style_guides" if defined?(StyleGuide)))
      end
    end
  end
end
