class Hike < ApplicationRecord
  belongs_to :trail
  has_many :hike_items
  has_many :items, through: :hike_items
  has_many :user_hikes
	has_many :users, through: :user_hikes
	accepts_nested_attributes_for :hike_items
end
