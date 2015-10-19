require "rails_helper"

RSpec.describe TeacherController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/teacher/index").to route_to("teacher#index")
    end

    it "routes to #promote" do
      expect(:get => "/teacher/1/promote").to route_to("teacher#promote", :id => "1")
    end

    it "routes to #downgrade" do
      expect(:get => "/teacher/1/downgrade").to route_to("teacher#downgrade", :id => "1")
    end
  end
end
