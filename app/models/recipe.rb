class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods

  def total_price
    recipe_foods.sum { |food| food.quantity * food.food.price }
  end

  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
end
