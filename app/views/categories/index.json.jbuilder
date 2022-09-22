json.categories do
  json.array! @categories do |category|
    json.id category['idCategory']
    json.name category['strCategory']
    json.description category['strCategoryDescription']
    json.image_url category['strCategoryThumb']
  end
end

json.first_page_url @meta[:first_url]
json.next_page_url @meta[:next_url]
json.last_page_url @meta[:last_url]
json.total_pages @meta[:pages]