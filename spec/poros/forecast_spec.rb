require 'rails_helper'

RSpec.describe Forecast do
  it 'exists', :vcr do

    response = WeatherFacade.weather_forecast('denver,co')

    expect(response.id).to be_nil
    expect(response.current_weather).to be_a Hash
    expect(response.current_weather.keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
    expect(response.daily_weather).to be_an Array
    expect(response.daily_weather.count).to eq 5
    response.daily_weather.each do |day|
      expect(day.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    end
    expect(response.hourly_weather).to be_an Array
    expect(response.hourly_weather.count).to eq 8
    response.hourly_weather.each do |hour|
      expect(hour.keys).to eq([:time, :temperature, :conditions, :icon])
    end
  end
end
