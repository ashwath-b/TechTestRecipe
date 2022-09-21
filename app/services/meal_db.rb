class MealDb
  require 'uri'
  require 'net/http'

  MEALDB_API_URL = 'https://themealdb.com/api'
  FORMAT = '/json'
  VERSION = '/v1/1'


  def categories_list
    uri = URI(category_url)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)['categories'] if res.is_a?(Net::HTTPSuccess)
  end

  private
  def base_url
    MEALDB_API_URL + FORMAT + VERSION
  end

  def category_url
    base_url + '/categories.php'
  end
end