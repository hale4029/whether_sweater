class Api::V1::FoodsController < ApplicationController
  def index
    food = Facade::Food.new(params)
    render json: FoodSerializer.new(food)
  end
end
