require 'rails_helper'
require 'vcr_setup'

RSpec.describe "Categories", type: :request do
  # before do
  #   VCR.use_cassette('categories.yml') do
  #     response = Net::HTTP.get_response(URI('https://themealdb.com/api/json/v1/1/categories.php'))
  #   end
  # end

  describe "GET /index" do
    it "returns http success", :vcr => true do
      get "/categories.json"
      expect(response).to have_http_status(:success)
    end
  end

end

# describe ExampleApiClient do
#   describe 'employees' do
#     let(:employees_response) { ExampleApiClient.employees() }
#     it "returns correctly some data", :vcr do
#       expect(employees_response).to be_kind_of(Hash)
#       expect(employees_response).to have_key(:status)
#       expect(employees_response).to have_key(:data)
#     end
#   end
# end