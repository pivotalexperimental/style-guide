require "spec_helper"

describe StyleGuide::Section do
  let(:path) { "/magnetic/sputum" }
  let(:section) { StyleGuide::Section.new("sputum", path) }

  describe ".id_from_path" do
    subject { StyleGuide::Section.id_from_path(path) }

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

  describe ".from_paths" do
    let(:paths) { path }
    subject { StyleGuide::Section.from_paths(paths).map(&:id) }

    context "with a single path" do
      it { should =~ ["sputum"] }
    end

    context "with multiple paths" do
      let(:paths) { ["/bat/wings", "/thinning/hair"] }

      it { should =~ ["wings", "hair"] }
    end

    context "with multiple paths having the same basename" do
      let(:paths) { ["/neck/wattle", "/underarm/wattle"] }

      it { should =~ ["wattle", "wattle1"] }
    end
  end

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

  describe "#partials" do
    let(:partial_paths) { ["/corrosive/chapstick", "/rusty/derringer"] }
    subject { section.partials }

    before { Dir.stub(:glob => partial_paths) }

    specify { subject.size.should eq 2 }
    specify { subject.first.should be_a StyleGuide::Partial }
  end
end
