require 'rails_helper'
require 'vcr_setup'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it "returns http success", :vcr => true do
      get "/categories.json"
      expect(response).to have_http_status(:success)
    end
  end
end