class Poro::GeoLocation
  def self.travel_information(start, end)
    data = GeoLocationService.directions(start, end)
    require "pry"; binding.pry
  end
end
