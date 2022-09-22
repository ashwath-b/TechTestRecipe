class CategoriesController < ApplicationController
  def index
    @pagy, @categories = pagy_array(MealDb.new.categories_list)
    @meta = pagy_metadata(@pagy)
  end
end
