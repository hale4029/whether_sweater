class Api::V1::ForecastsController < ApplicationController
  def index
    data = Facade::Forecast.new(params[:location])
    render json: ForecastSerializer.new(data)
  end
end
