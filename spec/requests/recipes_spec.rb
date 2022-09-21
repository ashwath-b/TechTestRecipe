require 'rails_helper'
require 'vcr_setup'

RSpec.describe "Recipes", type: :request do
  describe "GET /index" do
    it "returns http success", :vcr => true  do
      get "/categories/beef/recipes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success", :vcr => true  do
      get "/recipes/52874"
      expect(response).to have_http_status(:success)
    end
  end

end
