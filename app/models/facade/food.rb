class Facade::Food
  attr_reader :id, :end_location

  def initialize(params)
    @id = nil
    @end_location = params[:end]
    @start_location = params[:start]
    @food = params[:food]
  end

  def travel_data
    data ||= Poro::GeoLocation.travel_information(@start_location, @end_location)
  end

  def end_coordinates
    travel_data["end_location"]
  end

  def arrival_time
    Time.now.to_i + duration
  end

  def duration
    seconds ||= travel_data["duration"]["value"]
  end

  def travel_time
    travel_data["duration"]["text"]
  end

  def forecast
    forecast = DarkSkyService.expected_forecast(end_coordinates, arrival_time)
    forecast['currently']['summary']
  end

  def restaurant
    yelp = Poro::Yelp.new(end_coordinates, @food, arrival_time)
    {name: yelp.name, address: yelp.address}
  end
end
