class GeoLocationService
  def self.coordinates(location)
    resp = conn.get('json') do |req|
      req.params['address'] = location
    end
    json = JSON.parse(resp.body, sybomlize_names: true)
    json['results'][0]['geometry']['location']
  end

  private

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api/geocode') do |config|
      config.params['key'] = ENV['GEO_API_KEY']
    end
  end
end
