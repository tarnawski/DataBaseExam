require "rails_helper"

RSpec.describe QuestionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tests/1/questions").to route_to("questions#index", :test_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/tests/1/questions/new").to route_to("questions#new", :test_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/tests/1/questions/1").to route_to("questions#show", :test_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tests/1/questions/1/edit").to route_to("questions#edit", :test_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tests/1/questions").to route_to("questions#create", :test_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/tests/1/questions/1").to route_to("questions#update", :test_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tests/1/questions/1").to route_to("questions#destroy", :test_id => "1", :id => "1")
    end

  end
end
