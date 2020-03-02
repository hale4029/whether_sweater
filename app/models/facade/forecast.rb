class Facade::Forecast
  attr_reader :id

  def initialize(location)
    @id = nil
    @coordinates = GeoLocationService.coordinates(location)
  end

  def forecast
    json ||= DarkSkyService.forecast(@coordinates)
  end

  def current_weather
    forecast['currently']
  end

  def daily_forecast
    forecast['daily']
  end
end
