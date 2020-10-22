class HikeItemsController < ApplicationController
	before_action :find_hike_item, only: [:destroy]

	def new
		@hike_item = HikeItem.new
		@hike_id = Hike.first.id
		@items = Hike.first.items_available
	end

	def create
		@hike_item = HikeItem.create(hike_item_params)
		if @hike_item.valid?
			redirect_to new_hike_item_path
		else
			flash[:errors] = @hike_item.errors.full_messages
			redirect_to new_hike_item_path
		end
	end

	def destroy
		@hike_item.delete
		redirect_to hike_path(@hike_item.hike_id)
	end

	private

	def find_hike_item
		@hike_item = HikeItem.find(params[:id])
	end

	def hike_item_params
		params.require(:hike_item).permit(:hike_id, :item_id)
	end
end
