class Poro::GeoLocation
  def self.travel_information(start_location, end_location)
    data = GeoLocationService.directions(start_location, end_location)
    data['routes'][0]['legs'][0]
  end
end
