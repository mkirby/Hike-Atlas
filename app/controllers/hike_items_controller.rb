class HikeItemsController < ApplicationController
	before_action :find_hike_item, only: [:destroy]

	def new
		@hike_item = HikeItem.new
		@hike_id = params[:hike_id]
		@items = Hike.find(@hike_id).items_available(@current_user)
	end

	def create
		@hike_id = params[:hike_item][:hike_id]
		@items = Hike.find(@hike_id).items_available(@current_user)
		@hike_item = HikeItem.create(hike_item_params)
		if @hike_item.valid?
			if @items.count > 1
				redirect_to new_hike_item_path(params: {hike_id: @hike_id})
			else
				redirect_to hike_path(@hike_id)
			end
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
