class Poro::Yelp
  def initialize(end_coordinates, food, arrival_time)
    @biz_data = YelpService.find_restaurant(end_coordinates, food, arrival_time)
  end

  def address
    first = @biz_data['businesses'][0]['location']['display_address'][0]
    second = @biz_data['businesses'][0]['location']['display_address'][1]
    "#{first}, #{second}"
  end

  def name
    @biz_data['businesses'][0]['name']
  end
end
