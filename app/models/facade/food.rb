class Facade::Food
  attr_reader :id, :muchie, :end_location
  attr_accessor :arrival_time

  def initialize(params)
    @id = nil
    @type = 'munchie'
    @end_location = params[:end]
    @start_location = params[:start]
    @food = params[:food]
    @arrival_time ||= @arrival_time if travel_time
  end

  def end_coordinates
    coords ||= GeoLocationService.coordinates(@end_location)
  end

  def travel_time
    GeoLocationService.coordinates(@start_location, @end_location)
    require "pry"; binding.pry
    @arrival_time = ""
  end

  # def arrival_time
  #   @arrival_time ||= @arrival_time if travel_time
  # end

  def forecast
    DarkSkyService.expected_forecast(end_coordinates, @arrival_time)
  end

  def restaurant
    YelpService.find_restaurant(end_coordinates, @food, @arrival_time)
  end
end
