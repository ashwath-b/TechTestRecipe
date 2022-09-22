require 'rails_helper'
require 'vcr_setup'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index defaults to page 1' do
    it 'returns http success', :vcr => true  do
      get '/categories/beef/recipes'
      expect(response).to have_http_status(:success)
      expect(response.content_type).to match(a_string_including("application/json"))
      expect(JSON.parse(response.body)['recipes'].count).to eq 10
    end
  end

  describe 'GET /index for invalid page' do
    it 'returns empty page', :vcr => true do
      get '/categories/beef/recipes?page=10'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['recipes']).to eq nil
    end
  end

  describe 'GET /show' do
    it 'returns http success', :vcr => true  do
      get '/recipes/52874'
      expect(response).to have_http_status(:success)
    end
  end
end
