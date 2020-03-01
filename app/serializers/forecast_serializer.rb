class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather_temp, :current_weather_details, :week_forecast
end
