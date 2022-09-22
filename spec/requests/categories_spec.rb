require 'rails_helper'
require 'vcr_setup'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index defaults to page 1' do
    it 'returns http success', :vcr => true do
      get '/categories.json'
      expect(response).to have_http_status(:success)
      expect(response.content_type).to match(a_string_including('application/json'))
      expect(JSON.parse(response.body)['categories'].count).to eq 10
    end
  end

  describe 'GET /index for page 2' do
    it 'returns http success', :vcr => true do
      get '/categories?page=2'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['categories'].count).to eq 4
    end
  end
end