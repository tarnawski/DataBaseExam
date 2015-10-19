require "rails_helper"

RSpec.describe SqlboxController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sqlbox/index").to route_to("sqlbox#index")
    end
  end
end
