module Api
  class ResultsController < ApplicationController

    # GET /api/races/:race_id/results
    def index
      if !request.accept || request.accept == "*/*"
        render plain: api_race_results_path(params[:race_id])
      end
    end

    # GET /api/races/:race_id/results/:id
    def show
      if !request.accept || request.accept == "*/*"
        render plain: api_race_result_path(params[:race_id], params[:id])
      end
    end

  end
end
