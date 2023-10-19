class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, class_name: 'Food', foreign_key: 'user_id', dependent: :destroy
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id', dependent: :destroy
  has_many :recipe_foods, through: :recipes
  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
end
