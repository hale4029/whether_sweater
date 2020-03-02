class DarkSkyService
  def self.forecast(coordinates)
    resp = conn.get("#{coordinates['lat']},#{coordinates['lng']}") do |req|
      req.params['exclude'] = '[minutely,alerts,flags]'
    end
    JSON.parse(resp.body, sybomlize_names: true)
  end

  private

  def self.conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_SECRET']}")
  end
end
