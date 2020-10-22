class Hike < ApplicationRecord
  belongs_to :trail
  has_many :hike_items
  has_many :items, through: :hike_items
  has_many :user_hikes
	has_many :users, through: :user_hikes

	#takes in a user
	def items_available(user)
		items_not_added = user.items.select do |item|
			if self.items.include?(item)
			else
				item
			end
		end
	end

end
