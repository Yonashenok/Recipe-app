class GeneralShoppingsController < ApplicationController
	def index
		@recipe_food = current_user.recipe_foods.group(:food_id).sum(:quantity)
		@foods = current_user.foods
		@shopping = []    
		@foods.each do |food| 
			unless @recipe_food.key?(food.id)
				@shopping << food unless @shopping.include?(food) 
			end
	end
	@total_price =  @shopping.sum { |food| food.price }
	@total_item = @shopping.count
	end
end
