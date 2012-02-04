require "spec_helper"

describe NumbersController do
  describe "routing" do

    it "routes to #index" do
      get("/numbers").should route_to("numbers#index")
    end

    it "routes to #new" do
      get("/numbers/new").should route_to("numbers#new")
    end

    it "routes to #show" do
      get("/numbers/1").should route_to("numbers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/numbers/1/edit").should route_to("numbers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/numbers").should route_to("numbers#create")
    end

    it "routes to #update" do
      put("/numbers/1").should route_to("numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/numbers/1").should route_to("numbers#destroy", :id => "1")
    end

  end
end
