class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather, :daily_forecast
end
