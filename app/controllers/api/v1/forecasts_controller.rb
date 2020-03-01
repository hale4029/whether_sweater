class Api::V1::ForecastsController < ApplicationController

  def index
    data = Forecast.new(params[:location])
    require "pry"; binding.pry
    render json: ForecastSerializer(data)
  end

end
