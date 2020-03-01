class Forecast
  def initialize(location)
    @id = nil
    @coordinates = coordinates(location)
  end

  def coordinates(location)
    coords ||= GeoLocator.find_coordinates(location)
  end

  def dark_sky_data
    data ||= DarkSky.forecast(@coordinates)
  end

  def current_weather_temp
    dark_sky_data
  end

  def current_weather_details
    dark_sky_data
  end

  def week_forecast
    dark_sky_data
  end
end
