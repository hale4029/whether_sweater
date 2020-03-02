class Api::V1::FoodsController < ApplicationController
  def index
    data = Facade::Food.new(params)
    require "pry"; binding.pry
    render json: Food.new(data)
  end

  # private
  #
  # def params
  #   params.permit(:start, :end, :food)
  # end
end
