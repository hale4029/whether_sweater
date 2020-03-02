class UpsplashService
  def self.find_picture(icon)
    resp = conn.get('search/photos') do |req|
      req.params['query'] = icon
      req.params['orientation'] = 'landscape'
    end
    JSON.parse(resp.body, sybomlize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.unsplash.com') do |config|
      config.params['client_id'] = ENV['UPSPLASH_KEY']
    end
  end
end
