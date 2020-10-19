class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :hike_items
  has_many :hikes, through: :hike_items
end
