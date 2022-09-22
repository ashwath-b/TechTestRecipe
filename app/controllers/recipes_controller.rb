class RecipesController < ApplicationController
  def index
    @pagy, @recipes = pagy_array(MealDb.new.filter_by(params[:category_name]))
    @meta = pagy_metadata(@pagy)
  end

  def show
    @recipe = MealDb.new.get_recipe(params[:id])
  end
end
