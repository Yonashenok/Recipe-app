class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy public_toggle]

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe_food = @recipe.recipe_foods.includes(:food)
  end

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

  def public_toggle
    @recipe.public = !@recipe.public
    return unless @recipe.save

    redirect_to recipe_path(@recipe), notice: "The recipe is now #{@recipe.public ? 'public' : 'private'}"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
