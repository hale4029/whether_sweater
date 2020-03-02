class FoodSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :muchie, :end_location, :end_location, :travel_time, :forecast, :restaurant
end
