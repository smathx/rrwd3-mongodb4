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
      else
        race = Race.find(params[:id])
        render json: race
      end
    end

    # POST /api/races
    def create
      if !request.accept || request.accept == "*/*"
        if !params[:race].nil?
          render plain: params[:race][:name]
        else
          render plain: :nothing, status: :ok
        end
      else
        if !params[:race].nil?
          Race.create(race_params)
          render plain: race_params[:name], status: :created
        end
      end
    end

    # PUT,PATCH /api/races/:id
    def update
      #Rails.logger.debug("method=#{request.method}")
      race = Race.find(params[:id])
      race.update(race_params)
      render json: race
    end

    # DELETE /api/races/:id
    def destroy
      race = Race.find(params[:id])
      race.destroy
      render :nothing=>true, :status=>:no_content
    end

    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      render plain: "woops: cannot find race[#{params[:id]}]", status: :not_found
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def race_params
        params.require(:race).permit(:name, :date)
      end

  end
end
