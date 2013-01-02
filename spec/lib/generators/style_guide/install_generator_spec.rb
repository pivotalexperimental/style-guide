require "spec_helper"

describe StyleGuide::InstallGenerator do
  describe "#install" do
    before do
      subject.stub(:gem)
      subject.stub(:route)
      subject.stub(:system)
      subject.stub(:application)
      Rack.stub(:const_get)
      Guard.stub(:const_get)
      subject.stub(:routes_rb).and_return("mount StyleGuide::Engine")
      subject.stub(:guardfile).and_return("guard 'livereload'")
      subject.stub(:application_rb).and_return("config.style_guide.partial_paths")
      subject.stub(:development_rb).and_return("Rack::LiveReload")
    end

    describe "rack livereload dependency" do
      context "when rack-livereload is installed" do
        it "does not add rack-livereload to the Gemfile" do
          subject.should_not_receive(:gem).with("rack-livereload", anything)
          subject.install
        end
      end

      context "when rack-livereload is not installed" do
        before { Rack.stub(:const_get).and_raise(NameError) }

        it "adds rack-livereload to the Gemfile" do
          subject.should_receive(:gem).with("rack-livereload", anything)
          subject.install
        end
      end
    end

    describe "guard livereload dependency" do
      context "when guard-livereload is installed" do
        it "does not add guard-livereload to the Gemfile" do
          subject.should_not_receive(:gem).with("guard-livereload", anything)
          subject.install
        end
      end

      context "when guard-livereload is not installed" do
        before { Guard.stub(:const_get).and_raise(NameError) }

        it "adds guard-livereload to the Gemfile" do
          subject.should_receive(:gem).with("guard-livereload", anything)
          subject.install
        end
      end
    end

    describe "guard livereload configuration" do
      context "when guard-livereload is in the Guardfile" do
        it "does not add guard-livereload to the Guardfile" do
          subject.should_not_receive(:system).with("guard init livereload")
          subject.install
        end
      end

      context "when guard-livereload is not in the Guardfile" do
        before { subject.stub(:guardfile).and_return("meat") }

        it "adds guard-livereload to the Guardfile" do
          subject.should_receive(:system).with("guard init livereload")
          subject.install
        end
      end
    end

    describe "rails configuration" do
      context "when style guide is not configured in application.rb" do
        before { subject.stub(:application_rb).and_return("") }

        it "adds an entry for style guide partial paths" do
          subject.should_receive(:application).once.with(%(config.style_guide.partial_paths << #{subject.default_partial_path}))
          subject.install
        end
      end

      context "when style guide is configured in application.rb" do
        before { subject.stub(:application_rb).and_return("config.style_guide.partial_paths") }

        it "does not modify application.rb" do
          subject.should_not_receive(:application)
          subject.install
        end
      end
    end

    describe "development configuration" do
      context "when livereload is not configured in development.rb" do
        before { subject.stub(:development_rb).and_return("") }

        it "adds an entry for livereload" do
          subject.should_receive(:application).once.with('config.middleware.insert_before(::Rack::Lock, ::Rack::LiveReload, :min_delay => 500)', :env => "development")
          subject.install
        end
      end

      context "when livereload is already configured in development.rb" do
        before { subject.stub(:development_rb).and_return("Rack::LiveReload") }

        it "does not modify development.rb" do
          subject.should_not_receive(:application)
          subject.install
        end
      end
    end

    describe "mounting" do
      context "when style guide is not mounted" do
        before { subject.stub(:routes_rb).and_return("") }

        it "mounts the style guide" do
          subject.should_receive(:route).with('mount StyleGuide::Engine => "/style-guide"')
          subject.install
        end
      end

      context "when style guide is not mounted" do
        before { subject.stub(:routes_rb).and_return("mount StyleGuide::Engine") }

        it "does not mount the style guide" do
          subject.should_not_receive(:route)
          subject.install
        end
      end
    end
  end
end
