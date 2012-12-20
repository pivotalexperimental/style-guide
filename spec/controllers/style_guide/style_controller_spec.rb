require "spec_helper"

describe StyleGuide::StyleController do
  let(:temp_path) { Dir.mktmpdir }
  let(:partial_path) { File.join(temp_path, "monkey_hammer") }

  before do
    FileUtils.mkdir_p(partial_path)
    StyleGuide::Engine.config.style_guide.stub(:partial_paths => [partial_path])
  end

  describe "#index" do
    it "assigns sections" do
      get :index, use_route: :styles
      assigns(:sections).should be
      assigns(:sections).should have(1).section
      assigns(:sections).first.should be_a StyleGuide::Section
    end

    it "sets the current section to the first one" do
      get :index, use_route: :styles
      assigns(:current_section).should == assigns(:sections).first
      assigns(:current_section).title.should == "Monkey Hammer"
    end
  end

  describe "#show" do
    let(:fake_section) { StyleGuide::Section.new(partial_path) }

    it "assigns sections" do
      get :show, id: fake_section.id, use_route: :styles
      assigns(:sections).should be
      assigns(:sections).should have(1).section
      assigns(:sections).first.should be_a StyleGuide::Section
    end

    it "assigns the section" do
      get :show, id: fake_section.id, use_route: :styles
      assigns(:current_section).should be_a StyleGuide::Section
      assigns(:current_section).title.should == "Monkey Hammer"
    end
  end
end
