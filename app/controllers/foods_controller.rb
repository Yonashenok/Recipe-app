class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show destroy ]

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end


  # POST /foods or /foods.json
  def create
    @food = current_user.foods.build(food_params)

      if @food.save
        flash[:notice] = "Food was successfully created." 
        redirect_to foods_url(@food)
      else
        flash[:alert] = "Food was not created." 
        render :new, status: :unprocessable_entity 
      end
  end


  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      flash[:notice] = "Food was successfully destroyed."
      redirect_to foods_url
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    end
end
