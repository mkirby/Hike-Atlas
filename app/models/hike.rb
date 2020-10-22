class Hike < ApplicationRecord
  belongs_to :trail
  has_many :hike_items
  has_many :items, through: :hike_items
  has_many :user_hikes
	has_many :users, through: :user_hikes

	def items_available
		items_not_added = @current_user.items.select do |item|
			if self.items.include?(item)
			else
				item
			end
		end
	end

end
