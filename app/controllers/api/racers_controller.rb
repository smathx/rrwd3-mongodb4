module Api
  class RacersController < ApplicationController

    # GET /api/racers
    def index
      if !request.accept || request.accept == "*/*"
        render plain: api_racers_path
      end
    end

    # GET /api/racers/:id
    def show
      if !request.accept || request.accept == "*/*"
        render plain: api_racer_path(params[:id])
      end
    end

  end
end
