class TrailsController < ApplicationController
    before_action :find_trail, only: [:show]
    skip_before_action :authorized?, only: [:index]

    #ROOT HOME PAGE
    def index
        @city = params[:city]
        @state = params[:state]
        @max_distance = params[:max_distance]
        @max_results = params[:max_results]
        # number field returns ["20"]? maybe call @max_distance[0] and @max_results[0]
        if @city && @state && @max_distance && @max_results
            @api_data = Trail.trail_search(@city, @state, @max_distance, @max_results)
        end
    end

    def show
    end

    private

    def trail_params
        params.require(:trail).permit(:api_id, :name, :summary, :difficulty, :stars, :location, :img_sq_small, :img_medium, :length, :ascent, :high, :condition_status, :condition_details, :condition_date, :url)
    end
    
    def find_trail
        @trail = Trail.find(params[:id])
    end
end
