class RecipeFoodsController < ApplicationController
  before_action :set_recipe_foods, only: %i[edit destroy update]
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_id: @recipe.id)
  end

  def create
    @recipe = Recipe.find(params[:recipe_food][:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
    if @recipe_food.save
      flash[:notice] = 'Food created successfully.'
      redirect_to recipe_url(user_id: current_user.id, id: @recipe.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe_food.update(recipe_food_params)
      flash[:success] = 'Recipe Food updated successfully.'
    else
      flash[:alert] = 'Recipe Food not updated.'
    end
    redirect_to recipe_path(@recipe_food.recipe.id)
  end

  def destroy
    @recipe_food.destroy
    flash[:success] = 'Recipe Food deleted successfully.'
  end

  private

  def set_recipe_foods
    @recipe_food = RecipeFood.includes(:recipe).find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
