class HikesController < ApplicationController
    before_action :find_hike, only: [:show, :edit, :update, :destroy]

    def index
        # @upcoming_hikes = @current_user.upcoming_hikes
        # @past_hikes = @current_user.past_hikes
        @upcoming_hikes = User.first.upcoming_hikes
        @past_hikes = User.first.past_hikes
    end

    def show
    end

    def new
        @hike = Hike.new
        @items = @current_user.items
        if params[:api_id]
            @trail_id = Trail.find_or_create_trail(params[:api_id])
        end
    end

    def create
        @hike = Hike.create(hike_params)
        #doesn't know to make the hikeitem!?!
        #where hike_item creation exists

        if @hike.valid?
            redirect_to hike_path(@hike)
        else
            flash[:errors] = @hike.errors.full_messages
            redirect_to new_hike_path
        end
    end

    def edit
        # @items = @current_user.items
        @items = User.first.items
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
        @hike.destroy
        ## verify where we want this to go
        redirect_to trails_path
    end

    private

    def find_hike
        @hike = Hike.find(params[:id])
    end

    def hike_params
        params.require(:hike).permit(:trail_id, :start_date, :end_date, :note, hike_items_attributes: [:hike_id, :item_id])
	end
		
end
