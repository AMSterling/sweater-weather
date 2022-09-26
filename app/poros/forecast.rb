class Forecast
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @id = nil
    @current_weather = current(data)
    @daily_weather = daily(data)
    @hourly_weather = hourly(data)
  end

  def current(data)
      {
        datetime: Time.at(data[:current][:dt]).to_s(:date),
        sunrise: Time.at(data[:current][:sunrise]).to_s(:date),
        sunset: Time.at(data[:current][:sunset]).to_s(:date),
        temperature: data[:current][:temp],
        feels_like: data[:current][:feels_like],
        humidity: data[:current][:humidity],
        uvi: data[:current][:uvi],
        visibility: data[:current][:visibility],
        conditions: data[:current][:weather][0][:description],
        icon: data[:current][:weather][0][:icon]
      }
  end

  def hourly(data)
    hours = data[:hourly].take(8).map do |hour|
      {
        time: Time.at(hour[:dt]).to_s(:time),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end

  def daily(data)
    daily = data[:daily].take(5).map do |day|
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
  end
end
