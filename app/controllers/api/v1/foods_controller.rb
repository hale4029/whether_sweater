class Api::V1::FoodsController < ApplicationController
  def index
    require "pry"; binding.pry
    data = Facade::Food.new(params)
    render json: Food.new(data)
  end

  private

  def params
    params.permit(:start, :end, :food)
  end
end
