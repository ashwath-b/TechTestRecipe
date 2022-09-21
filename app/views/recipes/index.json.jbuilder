json.recipes do
  if @recipes.nil?
    json.nil!
  else
    json.array! @recipes do |recipe|
      json.id recipe['idMeal']
      json.name recipe['strMeal']
      json.image_url recipe['strMealThumb']
    end
  end
end