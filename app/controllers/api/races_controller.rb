module Api
  class RacesController < ApplicationController

    # GET /api/races
    def index
      if !request.accept || request.accept == "*/*"
        if !params[:offset].nil? and !params[:limit].nil?
          render plain: "#{api_races_path}, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
        else
          render plain: api_races_path
        end
      end
    end

    # GET /api/races/:id
    def show
      if !request.accept || request.accept == "*/*"
        render plain: api_race_path(params[:id])
      end
    end

    # POST /api/races
    def create
      if !request.accept || request.accept == "*/*"
        render plain: :nothing, status: :ok
      end
    end

  end
end
