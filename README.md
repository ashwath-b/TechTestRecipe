# README

## Requirements:
Fetch API data from https://themealdb.com/ for categories, category recipes & recipe endpoints and translate it into cleaner format


## Steps to start application

  This app need ruby version 2.5.1 & rails 6.1.7. Steps to run the application,

  * run `bundle install` from within the folder

  * Start rails server using the command `rails s`


## APIs:
* The categories & recipes APIs are paginated. The per_page has been set to 10. It can be changed in `.env` or by setting per_page value in `config/initializers/pagy.rb` file. The paginated APIs have a metadata i.e. first_page_url, next_page_url, last_page_url, total_pages,

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


Few decisions that I made,
- Did not use API versioning as there weren't multiple devices to support, do not see much breaking changes that could be introduced.
- No much exception handling, as the API either responds with right data or an empty/null data
- No authentication as the API are publicly available


















Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
