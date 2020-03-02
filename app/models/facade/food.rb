class Facade::Food
  attr_reader :id, :muchie, :end_location

  def initialize(params)
    @id = nil
    @type = 'munchie'
    @end_location = params[:end]
    @start_location = params[:start]
    @food = params[:food]
  end

  def travel_data
    data ||= GeoLocation.travel_information(@start_location, @end_location)
  end

  def end_coordinates
    travel_data
  end

  def arrival_time
    travel_data
  end

  def travel_time
    travel_data
  end

  def forecast
    DarkSkyService.expected_forecast(end_coordinates, arrival_time)
  end

  def restaurant
    YelpService.find_restaurant(end_coordinates, @food, arrival_time)
  end
end
