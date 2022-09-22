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
    let(:result) do
      {
        recipe: {
          id: "52874",
          name: "Beef and Mustard Pie",
          category: "Beef",
          area: "British",
          instructions: "Preheat the oven to 150C/300F/Gas 2.\r\nToss the beef and flour together in a bowl with some salt and black pepper.\r\nHeat a large casserole until hot, add half of the rapeseed oil and enough of the beef to just cover the bottom of the casserole.\r\nFry until browned on each side, then remove and set aside. Repeat with the remaining oil and beef.\r\nReturn the beef to the pan, add the wine and cook until the volume of liquid has reduced by half, then add the stock, onion, carrots, thyme and mustard, and season well with salt and pepper.\r\nCover with a lid and place in the oven for two hours.\r\nRemove from the oven, check the seasoning and set aside to cool. Remove the thyme.\r\nWhen the beef is cool and you're ready to assemble the pie, preheat the oven to 200C/400F/Gas 6.\r\nTransfer the beef to a pie dish, brush the rim with the beaten egg yolks and lay the pastry over the top. Brush the top of the pastry with more beaten egg.\r\nTrim the pastry so there is just enough excess to crimp the edges, then place in the oven and bake for 30 minutes, or until the pastry is golden-brown and cooked through.\r\nFor the green beans, bring a saucepan of salted water to the boil, add the beans and cook for 4-5 minutes, or until just tender.\r\nDrain and toss with the butter, then season with black pepper.\r\nTo serve, place a large spoonful of pie onto each plate with some green beans alongside.",
          image_url: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
          tags: "Meat,Pie",
          youtube_url: "https://www.youtube.com/watch?v=nMyBC9staMU",
          ingredients: [
            { name: "Beef", quantity: "1kg"},
            { name: "Plain Flour", quantity: "2 tbs" },
            { name: "Rapeseed Oil", quantity: "2 tbs" },
            { name: "Red Wine", quantity: "200ml" },
            { name: "Beef Stock", quantity: "400ml" },
            { name: "Onion", quantity: "1 finely sliced" },
            { name: "Carrots", quantity: "2 chopped" },
            { name: "Thyme", quantity: "3 sprigs" },
            { name: "Mustard", quantity: "2 tbs" },
            { name: "Egg Yolks", quantity: "2 free-range" },
            { name: "Puff Pastry", quantity: "400g" },
            { name: "Green Beans", quantity: "300g" },
            { name: "Butter", quantity: "25g" },
            { name: "Salt", quantity: "pinch" },
            { name: "Pepper", :quantity=>"pinch"}
          ],
          source: "https://www.bbc.co.uk/food/recipes/beef_and_mustard_pie_58002",
          img_source: nil,
          creative_commons_confirmed: nil,
          date_modified: nil
        }
      }
    end
    it 'returns http success', :vcr => true  do
      get '/recipes/52874'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(result)
    end
  end
end
