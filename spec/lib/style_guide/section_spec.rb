require "spec_helper"

describe StyleGuide::Section do
  let(:path) { "/magnetic/sputum" }
  let(:section) { StyleGuide::Section.new(path) }

  describe "#title" do
    subject { section.title }

    context "with a simple path" do
      it { should == "Sputum" }
    end

    context "with a path activerecord would be good at" do
      let(:path) { "/tasty/bicycle_tires" }

      it { should == "Bicycle Tires" }
    end

    context "with a path containing extra stuff" do
      let(:path) { "/help/kocher%has-m1y=keyb^oaard" }

      it { should == "Kocher%Has M1y=Keyb^Oaard" }
    end
  end

  describe "#id" do
    subject { section.id }

    context "with a simple path" do
      it { should == "sputum" }
    end

    context "with a good activerecord path" do
      let(:path) { "/tasty/bicycle_tires" }

      it { should == "bicycle_tires" }
    end

    context "with a path containing extra stuff" do
      let(:path) { "/help/kocher%has-m1y=keyb^oaard" }

      it { should == "kocher_has_m1y_keyb_oaard" }
    end
  end

  describe "#partials" do
    let(:partial_paths) { ["/corrosive/chapstick", "/rusty/derringer"] }
    subject { section.partials }

    before { Dir.stub(:glob => partial_paths) }

    it { should have(2).partials }
    its(:first) { should be_a StyleGuide::Partial }
  end
end
