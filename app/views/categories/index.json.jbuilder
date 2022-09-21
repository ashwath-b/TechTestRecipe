json.categories do
  json.array! @categories do |category|
    json.id category['idCategory']
    json.name category['strCategory']
    json.description category['strCategoryDescription']
    json.image_url category['strCategoryThumb']
  end
end