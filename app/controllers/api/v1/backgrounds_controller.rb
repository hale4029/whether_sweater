class Api::V1::BackgroundsController < ApplicationController

  def index
    data = Poro::Upsplash.new(params[:location])
    render json: UpsplashSerializer.new(data)
  end

end
