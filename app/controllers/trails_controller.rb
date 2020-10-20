class TrailsController < ApplicationController

    def index
    end

    def show
    end

    private

    def trail_params
        params.require(:trail).permit(:api_id, :name, :summary, :difficulty, :stars, :location, :img_sq_small, :img_medium, :length, :ascent, :high, :condition_status, :condition_details, :condition_date, :url)
    end
end
