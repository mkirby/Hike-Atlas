class TrailsController < ApplicationController
    before_action :find_trail, only: [:show]

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

    def new
        @trail = Trail.new
    end

    def create
        @trail = Trail.create(trail_params)
        if @trail.valid?
            # go somewhere?
            #redirect_to trail_path(@trail)
        else
            flash[:errors] = @trail.errors.full_messages
            redirect_to trails_path
        end
    end

    private

    def trail_params
        params.require(:trail).permit(:api_id, :name, :summary, :difficulty, :stars, :location, :img_sq_small, :img_medium, :length, :ascent, :high, :condition_status, :condition_details, :condition_date, :url)
    end
    
    def find_trail
        @trail = Trail.find(params[:id])
    end
end
