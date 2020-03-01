class DarkSky
  def forecast(coordinates)
    resp = conn.get('forecast') do |req|
      req.params['latitude'] = coordinates[:latitude]
      req.params['longitude'] = coordinates[:longitude]
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
