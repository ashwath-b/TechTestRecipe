json.recipe do
  if @recipe.nil?
    json.nil!
  else
    ingredients = []
    (1..20).each do |i|
      break if @recipe["strIngredient#{i}"] == ""
      ingredients << { name: @recipe["strIngredient#{i}"], quantity: @recipe["strMeasure#{i}"] }
    end
    json.id @recipe['idMeal']
    json.name @recipe['strMeal']
    json.category @recipe['strCategory']
    json.area @recipe['strArea']
    json.instructions @recipe['strInstructions']
    json.image_url @recipe['strMealThumb']
    json.tags @recipe['strTags']
    json.youtube_url @recipe['strYoutube']
    json.ingredients do
      json.array! ingredients do |ing|
        json.name ing[:name]
        json.quantity ing[:quantity]
      end
    end
    json.source @recipe['strSource']
    json.img_source @recipe['strImageSource']
    json.creative_commons_confirmed @recipe['strCreativeCommonsConfirmed']
    json.date_modified @recipe['dateModified']
  end
end