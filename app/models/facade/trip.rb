class Facade::Trip
  attr_reader :id, :origin, :destination

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
  end

  def travel_data
    data ||= Poro::GeoLocation.travel_information(@origin, @destination)
  end

  def end_coordinates
    travel_data["end_location"]
  end

  def arrival_time
    Time.now.to_i + duration
  end

  def travel_time
    travel_data["duration"]["text"]
  end

  def duration
    travel_data["duration"]["value"]
  end

  def arrival_forecast
    forecast = DarkSkyService.expected_forecast(end_coordinates, arrival_time)
    "#{forecast['currently']['temperature']}, #{forecast['currently']['summary']}"
  end
end
