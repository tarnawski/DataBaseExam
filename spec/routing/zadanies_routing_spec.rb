require "rails_helper"

RSpec.describe ZadaniesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/zadanies").to route_to("zadanies#index")
    end

    it "routes to #new" do
      expect(:get => "/zadanies/new").to route_to("zadanies#new")
    end

    it "routes to #show" do
      expect(:get => "/zadanies/1").to route_to("zadanies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/zadanies/1/edit").to route_to("zadanies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/zadanies").to route_to("zadanies#create")
    end

    it "routes to #update" do
      expect(:put => "/zadanies/1").to route_to("zadanies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/zadanies/1").to route_to("zadanies#destroy", :id => "1")
    end

  end
end
