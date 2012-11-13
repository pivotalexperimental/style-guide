module StyleGuide
  class Engine < ::Rails::Engine
    isolate_namespace StyleGuide

    initializer "hogan" do
      ::HoganAssets::Config.configure do |config|
        config.path_prefix = '../../../vendor/bootstrap/templates'
      end
    end
  end
end
