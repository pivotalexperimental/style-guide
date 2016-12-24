require "spec_helper"

describe StyleGuide::Config do
  describe "#paths" do
    context "when no paths have been added" do
      specify { subject.paths.size.should eq(1) }
    end

    context "when adding a path" do
      it "modifies the partial paths" do
        expect do
          subject.paths << "disappointment"
        end.to change{ subject.paths.count }.by(1)
      end
    end

    context "when setting the paths" do
      it "sets the partial paths" do
        expect do
          subject.paths = "loathing"
        end.to change { subject.paths }.to(["loathing"])
      end
    end

    context "after a path has been added" do
      before { subject.paths << "partials-and-magic-beans" }

      specify { subject.paths.should include "partials-and-magic-beans" }
    end
  end

  describe "#sections" do
    context "when no paths have been added" do
      it { subject.sections.size.should be >= 1 }
      specify { subject.sections.first.should be_a StyleGuide::Section }
    end

    context "when adding a nonexistent path" do
      it "has no impact on the sections" do
        expect do
          subject.paths << "disappointment"
        end.not_to change{ subject.sections.count }
      end
    end

    context "when adding a non-globbed path" do
      let(:path) { StyleGuide::Engine.root.join("app", "views") }

      it "only adds that base path" do
        expect do
          subject.paths << path
        end.to change { subject.sections.count }.by(1)
      end
    end

    context "when adding a globbed path" do
      let(:path) { StyleGuide::Engine.root.join("app", "views", "layouts", "*") }

      it "obeys globbing" do
        expect do
          subject.paths << path
        end.to change { subject.sections.count }.by(1)
      end
    end

    context "when adding existing paths" do
      let(:path) { StyleGuide::Engine.root.join("app", "views", "bootstrap", "**", "*") }

      it "deduplicates existing paths" do
        expect do
          subject.paths << path
        end.not_to change { subject.sections.count }
      end
    end
  end
end
