class MealDb
  require 'uri'
  require 'net/http'

  def categories_list
    uri = URI(category_url)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)['categories'] if res.is_a?(Net::HTTPSuccess)
  end

  def filter_by(category_name)
    uri = URI(filter_url(category_name))
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)['meals'] || [] if res.is_a?(Net::HTTPSuccess)
  end

  def get_recipe(meal_id)
    uri = URI(recipe_url(meal_id))
    res = Net::HTTP.get_response(uri)
    (JSON.parse(res.body)['meals'] && JSON.parse(res.body)['meals'][0]) || nil
  end

  private
  def base_url
    ENV['MEALDB_API_URL'] + ENV['FORMAT'] + ENV['VERSION']
  end

  def category_url
    base_url + '/categories.php'
  end

  def filter_url(category_name)
    base_url + "/filter.php?c=#{category_name}"
  end

  def recipe_url(meal_id)
    base_url + "/lookup.php?i=#{meal_id}"
  end
end