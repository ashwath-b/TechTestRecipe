class RecipesController < ApplicationController
  def index
    @recipes = MealDb.new.filter_by(params[:category_name])
  end

  def show
    @recipe = MealDb.new.get_recipe(params[:id])
  end
end
