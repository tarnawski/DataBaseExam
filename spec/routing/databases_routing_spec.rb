require "rails_helper"

RSpec.describe DatabasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/databases").to route_to("databases#index")
    end

    it "routes to #new" do
      expect(:get => "/databases/new").to route_to("databases#new")
    end

    it "routes to #show" do
      expect(:get => "/databases/1").to route_to("databases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/databases/1/edit").to route_to("databases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/databases").to route_to("databases#create")
    end

    it "routes to #update" do
      expect(:put => "/databases/1").to route_to("databases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/databases/1").to route_to("databases#destroy", :id => "1")
    end

  end
end
