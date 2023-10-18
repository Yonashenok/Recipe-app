class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
<<<<<<< HEAD
  has_many :recipe_foods, class_name: "RecipeFood", foreign_key: "food_id", dependent: :destroy
  has_many :recipes, through: :recipe_foods

=======
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id', dependent: :destroy
  has_many :recipes, through: :recipe_foods
>>>>>>> dev
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
