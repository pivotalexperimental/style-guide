require "spec_helper"

describe StyleGuide::Partial do
  let(:path) { "/hygenic/_gargling.erb" }
  let(:section) { StyleGuide::Section.from_paths("/flaky/gangrene").first }
  let(:partial) { StyleGuide::Partial.new(path, section) }

  describe "#title" do
    subject { partial.title }

    context "with a simple path" do
      it { should == "Gargling" }
    end

    context "with a path activerecord would be good at" do
      let(:path) { "/tasty/_tree-leather.erb" }

      it { should == "Tree Leather" }
    end

    context "with a path containing extra stuff" do
      let(:path) { "/help/_a!dog%has-m1y=keyb^oaard.erb" }

      it { should == "A!Dog%Has M1y=Keyb^Oaard" }
    end
  end

  describe "#id" do
    subject { partial.id }

    context "with a simple path" do
      it { should == "gargling" }
    end

    context "with a good activerecord path" do
      let(:path) { "/tasty/_thumb_tacks.erb" }

      it { should == "thumb_tacks" }
    end

    context "with a path containing extra stuff" do
      let(:path) { "/help/mugabe%has-m1y=keyb^oaard" }

      it { should == "mugabe_has_m1y_keyb_oaard" }
    end
  end

  describe "#description" do
    subject { partial.description }

    context "when no translation string exists" do
      before { I18n.stub(:translate => nil) }

      it { should be_nil }
    end

    context "when there is a translation string available" do
      let(:translated) { "pants" }

      before { I18n.stub(:translate => translated) }

      it { should include "<p>pants" }

      context "when the translated string includes html" do
        let(:translated) { '`<br>`' }

        it { should include '&lt;br&gt;' }
      end

      context "when the translated string includes markdown" do
        let(:translated) { "`meat` *beans* __socks__" }

        it { should include "<code>meat" }
        it { should include "<em>beans" }
        it { should include "<strong>socks" }
      end
    end
  end

  describe "#classes" do
    let(:content) { %(<div class="noseclip"><img class="earplug noseclip"></div>) }

    before { partial.stub(:render => content) }

    subject { partial.classes }

    it { should =~ %w(.noseclip .earplug) }
  end

  describe "#ids" do
    let(:content) { %(<div id="stent"><img id="cholesterol"></div>) }

    before { partial.stub(:render => content) }

    subject { partial.ids }

    it { should =~ %w(#cholesterol #stent) }
  end

  describe "#identifiers" do
    before do
      partial.stub(:classes => %w(.puppies .rainbows))
      partial.stub(:ids => %w(#ice-cream #lollipops))
    end

    subject { partial.identifiers }

    it { should =~ %w(.puppies .rainbows #ice-cream #lollipops) }
  end

  describe "#render" do
    let(:mock_view) { double(:view, :render => "hi") }

    before { partial.stub(:action_view).and_return(mock_view) }

    subject { partial.render }

    it { should == "hi" }
  end

  describe "#render_source" do
    # NEED SUGGESTION.
    let(:source_code) { '<html>\n  <div></div></html>' }

    before { partial.stub(:source).and_return(source_code) }

    subject { partial.render_source_code }

    it { should == '<html>\n  <div></div></html>' }
  end
end
