class HikesController < ApplicationController
    before_action :find_hike, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
        @hike = Hike.new
    end

    def create
        @hike = Hike.create(hike_params)
        if @hike.valid?
            redirect_to hike_path(@hike)
        else
            flash[:errors] = @hike.errors.full_messages
            redirect_to new_hike_path
        end
    end

    def edit
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
        redirect_to trails_path)
    end

    private

    def find_hike
        @hike = Hike.find(params[:id])
    end

    def hike_params
        params.require(:hike).permit(:trail_id, :start_date, :end_date, :note)
    end
end
