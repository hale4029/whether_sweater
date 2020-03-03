class Api::V1::TripsController < ApplicationController
  def create
    user = User.find_by(auth_token: params[:api_key])
    if user
      trip = Facade::Trip.new(params[:origin], params[:destination])
      render json: TripSerializer.new(trip)
    else
      render json: {message: 'Invalid Key'}, status: :unauthorized
    end
  end
end
