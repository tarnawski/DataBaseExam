require "rails_helper"

RSpec.describe ResultsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tests/1/results").to route_to("results#index", :test_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/tests/1/results/new").to route_to("results#new", :test_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/tests/1/results/1").to route_to("results#show", :test_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tests/1/results/1/edit").to route_to("results#edit", :test_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tests/1/results").to route_to("results#create", :test_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/tests/1/results/1").to route_to("results#update", :test_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tests/1/results/1").to route_to("results#destroy", :test_id => "1", :id => "1")
    end

  end
end
