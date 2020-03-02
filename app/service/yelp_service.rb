class YelpService
  def self.find_restaurant()
    resp = conn.get('search') do |req|
      req.params['term'] = search
      req.params['latitude'] = lat
      req.params['longitude'] = lng
      req.params['open_at'] = time #unix
    end
    JSON.parse(resp.body, sybomlize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.yelp.com/v3/businesses') do |config|
      config.params['Authorization'] = ENV['YELP_KEY']
    end
  end
end
