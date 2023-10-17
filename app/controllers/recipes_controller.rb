class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  def index
    @recipes = current_user.recipes
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created.'
      redirect_to recipes_url(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = 'Recipe was successfully destroyed.'
    redirect_to recipes_url
    format.json { head :no_content }
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
