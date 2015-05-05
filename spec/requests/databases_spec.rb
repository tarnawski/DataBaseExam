require 'rails_helper'

RSpec.describe "Databases", type: :request do
  describe "GET /databases" do
    it "works! (now write some real specs)" do
      get databases_path
      expect(response).to have_http_status(200)
    end
  end
end
