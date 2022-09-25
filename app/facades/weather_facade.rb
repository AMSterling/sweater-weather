class WeatherFacade
  def self.weather_forecast(location)
    locale = MapService.get_location(location)
    forecast = WeatherService.get_weather(locale[:lat], locale[:lng])
      OpenStruct.new({
          data: {
          id: nil,
          type: 'forecast',
          attributes: {
          current_weather: current_weather(forecast),
          daily_weather: daily_weather(forecast),
          hourly_weather: hourly_weather(forecast)
        }}})
  end

  def self.current_weather(forecast)
      {
        datetime: Time.at(forecast[:current][:dt]).to_s(:date),
        sunrise: Time.at(forecast[:current][:sunrise]).to_s(:date),
        sunset: Time.at(forecast[:current][:sunset]).to_s(:date),
        temperature: forecast[:current][:temp],
        feels_like: forecast[:current][:feels_like],
        humidity: forecast[:current][:humidity],
        uvi: forecast[:current][:uvi],
        visibility: forecast[:current][:visibility],
        conditions: forecast[:current][:weather][0][:description],
        icon: forecast[:current][:weather][0][:icon]
      }
  end

  def self.hourly_weather(forecast)
      hours = forecast[:hourly].map do |hour|
        {
          time: Time.at(hour[:dt]).to_s(:time),
          temperature: hour[:temp],
          conditions: hour[:weather][0][:description],
          icon: hour[:weather][0][:icon]
        }
      end
      hours.first(8)
  end

  def self.daily_weather(forecast)
    daily = forecast[:daily].map do |day|
      {
        date: Time.at(day[:dt]).to_date,
        sunrise: Time.at(day[:sunrise]).to_s(:db),
        sunset: Time.at(day[:sunset]).to_s(:db),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
    daily.first(5)
  end
end
