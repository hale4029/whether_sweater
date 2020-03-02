class Poro::Upsplash
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
    @coordinates = GeoLocationService.coordinates(location)
  end

  def weather_image
    icon = Poro::DarkSky.current_weather_icon(@coordinates)
    json = UpsplashService.find_picture("#{@location} #{icon}")
    json['results'][0]['urls']
  end
end
