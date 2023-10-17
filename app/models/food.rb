class Food < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "user_id"

	validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
