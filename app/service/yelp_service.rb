class YelpService
  def self.find_restaurant(coordinates, search, time)
    resp = conn.get('search') do |req|
      req.params['term'] = search
      req.params['latitude'] = coordinates['lat']
      req.params['longitude'] = coordinates['lng']
      req.params['open_at'] = time
    end
    JSON.parse(resp.body, sybomlize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.yelp.com/v3/businesses') do |config|
      config.headers['Authorization'] = ENV['YELP_KEY']
    end
  end
end
