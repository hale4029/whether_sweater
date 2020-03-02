class UpsplashSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :weather_image
end
