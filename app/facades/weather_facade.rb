class WeatherFacade
  def self.weather_forecast(location)
    locale = MapService.get_location(location)
    forecast = WeatherService.get_weather(locale[:lat], locale[:lng])
    Forecast.new(forecast)
  end
end
