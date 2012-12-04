require "spec_helper"

describe StyleGuide::StyleController do
  describe "#index" do
    it "assigns sections" do
      get :index, use_route: :styles
      assigns(:sections).should be
      assigns(:sections).first.should be_a StyleGuide::Section
    end

    it "sets the active section to the first one" do
      get :index, use_route: :styles
      assigns(:active).should == assigns(:sections).first
    end
  end
end
