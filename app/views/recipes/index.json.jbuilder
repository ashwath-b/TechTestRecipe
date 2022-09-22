json.recipes do
  if @recipes.empty?
    json.nil!
  else
    json.array! @recipes do |recipe|
      json.id recipe['idMeal']
      json.name recipe['strMeal']
      json.image_url recipe['strMealThumb']
    end
  end
end

json.metadata do
  json.first_page_url @meta[:first_url]
  json.next_page_url @meta[:next_url]
  json.last_page_url @meta[:last_url]
  json.total_pages @meta[:pages]
end