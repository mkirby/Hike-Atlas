class HikesController < ApplicationController
    before_action :find_hike, only: [:show, :edit, :update, :destroy]

    def index
        @upcoming_hikes = @current_user.upcoming_hikes
        @past_hikes = @current_user.past_hikes
    end

    def show
        @items_available = Hike.find(@hike.id).items_available(@current_user)
    end

    def new
        @hike = Hike.new
            @items = @current_user.items
            @hike_item = HikeItem.new
        if params[:api_id]
            @trail_id = Trail.find_or_create_trail(params[:api_id])
        end
    end

    def create
        @hike = Hike.create(hike_params)
        if @hike.valid?
            @user_hike = UserHike.create(hike_id: @hike.id, user_id: @current_user.id)
            redirect_to hike_path(@hike)
        else
            flash[:errors] = @hike.errors.full_messages
            redirect_to new_hike_path
        end
    end

    def edit
        @items = @current_user.items
        @trail_id = @hike.trail_id
    end

    def update
        if @hike.update(hike_params)
            redirect_to hike_path(@hike)
        else
            flash[:errors] = @hike.errors.full_messages
            redirect_to edit_hike_path
        end
    end

    def destroy
        #find all hikeitems related to a single hike
        all_hike_items = HikeItem.all.select { |record| record.hike_id == @hike.id}
        #destroy each join table record
        all_hike_items.each { |record| record.delete}
        #delete the item

        #find all UserHikes related to a single hike
        all_user_hikes = UserHike.all.select { |record| record.hike_id == @hike.id}
        #destroy each join table record
        all_user_hikes.each { |record| record.delete}
        #delete the item

        @hike.delete
        redirect_to trails_path
    end

    private

    def find_hike
        @hike = Hike.find(params[:id])
    end

    def hike_params
        params.require(:hike).permit(:trail_id, :start_date, :end_date, :note, hike_item_attributes: [:hike_id, :item_id])
		end
		
end
