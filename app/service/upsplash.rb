class Upsplash

  def find_picture(icon)
    resp = conn.get('search/photos') do |req|
      c.params['query'] = icon
      c.params['orientation'] = 'landscape'
    end
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |config|
      config.params['client_id'] = ENV['UPSPLASH_KEY']
    end
  end
end
