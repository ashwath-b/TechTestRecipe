class CategoriesController < ApplicationController
  def index
    @categories = MealDb.new.categories_list
  end
end
