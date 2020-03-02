class Facade::Forecast
  attr_reader :id

  def initialize(location)
    @id = nil
    @coordinates = GeoLocationService.coordinates(location)
  end

  def forecast
    DarkSkyService.forecast(@coordinates)
  end

  def current_weather
    require "pry"; binding.pry
    forecast
    ['attributes']['forecast']['currently']
  end

  def daily_forecast
    require "pry"; binding.pry
    forecast['attributes']['forecast']['daily']
  end

end
