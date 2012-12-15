require "spec_helper"

describe StyleGuide::Config do
  describe "#partial_paths" do
    context "when no paths have been added" do
      it { should have_at_least(1).partial_path }
      its(:partial_paths) { should_not include StyleGuide::Engine.root.join("app/views/style_guide/style") }
    end

    context "when adding a path" do
      it "modifies the partial paths" do
        expect do
          subject.partial_paths << "disappointment"
        end.to change{ subject.partial_paths.count }.by(1)
      end
    end

    context "when setting the paths" do
      it "sets the partial paths" do
        expect do
          subject.partial_paths = "loathing"
        end.to change { subject.partial_paths }.to(["loathing"])
      end
    end

    context "after a path has been added" do
      before { subject.partial_paths << "partials-and-magic-beans" }

      its(:partial_paths) { should include "partials-and-magic-beans" }
    end
  end
end
