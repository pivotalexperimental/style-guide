require "spec_helper"

describe StyleGuide::Config do
  describe "#partial_paths" do
    context "when no paths have been added" do
      it { should have(1).partial_path }
      its(:partial_paths) { should == [StyleGuide::Engine.root.join("app/views/style_guide/bootstrap_base_css")] }
    end

    context "after a path has been added" do
      before { subject.partial_paths << "partials-and-magic-beans" }

      it { should have(2).partial_paths }
      its(:partial_paths) { should include "partials-and-magic-beans" }
    end
  end
end
