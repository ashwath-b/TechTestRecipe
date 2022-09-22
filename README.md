# README

## Requirements:
Fetch API data from https://themealdb.com/ for categories, category recipes & recipe endpoints and translate it into cleaner format


## Steps to start application

  This app need ruby version 2.5.1 & rails 6.1.7. Steps to run the application,

  * Few ENV variables to be set are in .env file

  * run `bundle install` from within the folder

  * Start rails server using the command `rails s`


## APIs:
* The categories & recipes APIs are paginated. The per_page has been set to 10. It can be changed in `.env` or by setting per_page value in `config/initializers/pagy.rb` file. The paginated APIs have a metadata i.e. first_page_url, next_page_url, last_page_url, total_pages.

* From chrome/firefox browser we can make requests to the server
  - for categories list: `http://localhost:3000/categories`
    This will list the categories in a paginated format (10 per page)
    For subsequent pages the request would be:
    `http://localhost:3000/categories?page={page_number}`

    Ex: `http://localhost:3000/categories?page=2`

  - for recipes list for a particular category, ex: desssert, `http://localhost:3000/categories/dessert/recipes`
    This will list the recipes in a paginated format (10 per page)
    For subsequent pages the request,
    `http://localhost:3000/categories/dessert/recipes?page={page_number}`

     ex: `http://localhost:3000/categories/dessert/recipes?page=2`
  
  - for the recipe of a particular meal: `http://localhost:3000/recipes/{meal_id}`

    ex: `http://localhost:3000/recipes/52878`


Few decisions,
- Did not use API versioning as there weren't multiple devices to support, do not see much breaking changes that could be introduced
- No much exception handling, as the API either responds with right data or an empty/null data
- No authentication as the API are publicly available
- Considered only JSON request & response
- Used services design pattern to fetch the data
- Used jbuilder seralizer to format the data (serializer pattern)



## Sample App has been deployed to Heroku. Few samples of API links for the deployed app:
- categories API:
  https://recipetechtest.herokuapp.com/categories
  https://recipetechtest.herokuapp.com/categories?page=2

- Category recipes:
  https://recipetechtest.herokuapp.com/categories/dessert/recipes
  https://recipetechtest.herokuapp.com/categories/dessert/recipes?page=2

- Recipe:
  https://recipetechtest.herokuapp.com/recipes/52892
  https://recipetechtest.herokuapp.com/recipes/52928