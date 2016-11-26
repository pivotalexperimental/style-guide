require "spec_helper"

describe StyleGuide::StyleController, type: :controller do
  routes { StyleGuide::Engine.routes }

  let(:temp_path) { Dir.mktmpdir }
  let(:partial_path) { File.join(temp_path, "monkey_hammer") }

  before do
    FileUtils.mkdir_p(partial_path)
    StyleGuide::Engine.config.style_guide.paths = "#{temp_path}/*"
  end

  describe "#index" do
    it "assigns sections" do
      get :index
      assigns(:sections).should be
      assigns(:sections).size.should eq 1
      assigns(:sections).first.should be_a StyleGuide::Section
    end

    it "sets the current section to the first one" do
      get :index
      assigns(:current_section).should == assigns(:sections).first
      assigns(:current_section).title.should == "Monkey Hammer"
    end
  end

  describe "#show" do
    it "assigns sections" do
      get :show, id: "monkey_hammer"
      assigns(:sections).should be
      assigns(:sections).size.should eq 1
      assigns(:sections).first.should be_a StyleGuide::Section
    end

    it "assigns the section" do
      get :show, id: "monkey_hammer"
      assigns(:current_section).should be_a StyleGuide::Section
      assigns(:current_section).title.should == "Monkey Hammer"
    end
  end
end
