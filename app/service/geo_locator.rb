class GeoLocator
  def find_coordinates(location)
    resp = conn.get('json') do |req|
      req.params['address'] = location
    end
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/geocode') do |config|
      config.params['key'] = ENV['GEO_API_KEY']
    end
  end
end
