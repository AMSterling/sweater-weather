require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  it 'can get weather forecast' do
    response = WeatherService.get_weather(39.738453, -104.984853)

    expect(response).to be_a Hash
    expect(response).to have_key(:lat)
    expect(response[:lat]).to eq(39.7385)
    expect(response).to have_key(:lon)
    expect(response[:lon]).to eq(-104.9849)
    expect(response).to have_key(:current)
    expect(response[:current]).to have_key(:dt)
    expect(response[:current][:dt]).to be_an Integer
    expect(response[:current]).to have_key(:sunrise)
    expect(response[:current]).to have_key(:sunset)
    expect(response[:current]).to have_key(:temp)
    expect(response[:current][:temp]).to be_a Numeric # error on Float when whole Integer
    expect(response[:current]).to have_key(:feels_like)
    expect(response[:current][:feels_like]).to be_a Float
    expect(response[:current]).to have_key(:pressure)
    expect(response[:current]).to have_key(:humidity)
    expect(response[:current][:humidity]).to be_an Integer
    expect(response[:current]).to have_key(:uvi)
    expect(response[:current]).to have_key(:clouds)
    expect(response[:current]).to have_key(:visibility)
    expect(response[:current]).to have_key(:wind_speed)
    expect(response[:current]).to have_key(:wind_deg)
    expect(response[:current]).to have_key(:weather)
    expect(response[:current][:weather]).to be_an Array
    expect(response[:current][:weather][0]).to be_a Hash
    expect(response[:current][:weather][0]).to have_key(:id)
    expect(response[:current][:weather][0]).to have_key(:main)
    expect(response[:current][:weather][0]).to have_key(:description)
    expect(response[:current][:weather][0]).to have_key(:icon)
    expect(response).to have_key(:hourly)
    response[:hourly].each do |hour|
      expect(hour).to have_key(:dt)
      expect(hour[:dt]).to be_an Integer
      expect(hour).to_not have_key(:sunrise)
      expect(hour).to_not have_key(:sunset)
      expect(hour).to have_key(:temp)
      expect(hour[:temp]).to be_a Numeric
      expect(hour).to have_key(:feels_like)
      expect(hour[:feels_like]).to be_a Numeric
      expect(hour).to have_key(:pressure)
      expect(hour).to have_key(:humidity)
      expect(hour[:humidity]).to be_an Integer
      expect(hour).to have_key(:uvi)
      expect(hour).to have_key(:clouds)
      expect(hour).to have_key(:visibility)
      expect(hour).to have_key(:weather)
      expect(hour[:weather]).to be_an Array
      expect(hour[:weather][0]).to be_a Hash
      expect(hour[:weather][0]).to have_key(:id)
      expect(hour[:weather][0]).to have_key(:main)
      expect(hour[:weather][0]).to have_key(:description)
      expect(hour[:weather][0]).to have_key(:icon)
    end
    expect(response).to have_key(:daily)
    response[:daily].each do |day|
      expect(day).to have_key(:dt)
      expect(day[:dt]).to be_an Integer
      expect(day).to have_key(:sunrise)
      expect(day).to have_key(:sunset)
      expect(day).to have_key(:moonrise)
      expect(day).to have_key(:moonset)
      expect(day).to have_key(:moon_phase)
      expect(day).to have_key(:temp)
      # expect(day[:temp]).to be_a Float
      expect(day).to have_key(:feels_like)
      # expect(day[:feels_like]).to be_a Float
      expect(day).to have_key(:pressure)
      expect(day).to have_key(:humidity)
      expect(day[:humidity]).to be_an Integer
      expect(day).to have_key(:dew_point)
      expect(day).to have_key(:wind_speed)
      expect(day).to have_key(:wind_deg)
      expect(day).to have_key(:wind_gust)
      expect(day).to_not have_key(:visibility)
      expect(day).to have_key(:weather)
      expect(day[:weather]).to be_an Array
      expect(day[:weather][0]).to be_a Hash
      expect(day[:weather][0]).to have_key(:id)
      expect(day[:weather][0]).to have_key(:main)
      expect(day[:weather][0]).to have_key(:description)
      expect(day[:weather][0]).to have_key(:icon)
      expect(day).to have_key(:clouds)
      expect(day).to have_key(:pop)
      expect(day).to have_key(:uvi)
    end
  end
end
