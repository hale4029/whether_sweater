class GeoLocationService
  def self.coordinates(location)
    resp = conn.get('/geocode/json') do |req|
      req.params['address'] = location
    end
    json = JSON.parse(resp.body, sybomlize_names: true)
    json['results'][0]['geometry']['location']
  end

  def self.directions(origin, destination)
    resp = conn.get('directions/json') do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
    end
    JSON.parse(resp.body, sybomlize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api') do |config|
      config.params['key'] = ENV['GEO_API_KEY']
    end
  end
end
