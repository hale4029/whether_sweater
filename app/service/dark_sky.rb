class DarkSky
  def forecast(long_lat)
    resp = conn.get('forecast') do |req|
      req.params['latitude'] = long_lat[:latitude]
      req.params['longitude'] = long_lat[:longitude]
      req.params['exclude'] = '[minutely,hourly,alert,flags]'
    end
  end

  private

  def conn
    Faraday.new('https://api.darksky.net') do |config|
      config.params['key'] = ENV['DARKSKY_SECRET']
    end
  end
end
