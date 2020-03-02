class Poro::DarkSky
  def self.current_weather_icon(coordinates)
    json = DarkSkyService.forecast(coordinates)
    #json['currently']['summary']
    json['currently']['icon']
  end
end
