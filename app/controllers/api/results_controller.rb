module Api
  class ResultsController < ApplicationController

    # GET /api/races/:race_id/results
    def index
      if !request.accept || request.accept == "*/*"
        render plain: api_race_results_path(params[:race_id])
      else
        @race = Race.find(params[:race_id])
        @entrants = @race.entrants
        render :index
      end
    end

    # GET /api/races/:race_id/results/:id
    def show
      if !request.accept || request.accept == "*/*"
        render plain: api_race_result_path(params[:race_id], params[:id])
      else
        @result = Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
        render :show
      end
    end

    # PUT,PATCH /api/races/:race_id/results/:id
    def update
      entrant = Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first

      result = params[:result]

      if result
        if result[:swim]
          entrant.swim = entrant.race.race.swim
          entrant.swim_secs = result[:swim].to_f
        end
        if result[:t1]
          entrant.t1 = entrant.race.race.t1
          entrant.t1_secs = result[:t1].to_f
        end
        if result[:bike]
          entrant.bike = entrant.race.race.bike
          entrant.bike_secs = result[:bike].to_f
        end
        if result[:t2]
          entrant.t2 = entrant.race.race.t2
          entrant.t2_secs = result[:t2].to_f
        end
        if result[:run]
          entrant.run = entrant.race.race.run
          entrant.run_secs = result[:run].to_f
        end
      end

      entrant.save
      render plain: :nothing, status: :ok
    end

  end
end
