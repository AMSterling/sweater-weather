require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'building a forecast' do
    # before :each do
    #   locale = MapService.get_location('denver,co')
    #   @weather = WeatherService.get_weather(locale[:lat], locale[:lng])
    # end
    #
    it 'builds the complete forecast by location', :vcr do

      response = WeatherFacade.weather_forecast('denver,co')

      expect(response).to be_a Forecast
      # expect(response).to be_a Hash
      # expect(response).to have_key(:id)
      # expect(response[:id]).to be_nil
      # expect(response).to have_key(:type)
      # expect(response[:type]).to eq('forecast')
      # expect(response).to have_key(:attributes)
      # expect(response[:attributes].count).to eq 3
      # expect(response[:attributes]).to have_key(:current_weather)
      # expect(response[:attributes]).to have_key(:daily_weather)
      # expect(response[:attributes][:daily_weather].count).to eq 5
      # expect(response[:attributes]).to have_key(:hourly_weather)
      # expect(response[:attributes][:hourly_weather].count).to eq 8
    end

    # xit 'builds current weather from map location', :vcr do
    #
    #   response = WeatherFacade.current_weather(@weather)
    #
    #   expect(response).to be_a Hash
    #   expect(response).to have_key(:datetime)
    #   expect(response[:datetime]).to be_a String
    #   expect(response).to have_key(:sunrise)
    #   expect(response[:sunrise]).to be_a String
    #   expect(response).to have_key(:sunset)
    #   expect(response[:sunset]).to be_a String
    #   expect(response).to have_key(:temperature)
    #   expect(response[:temperature]).to be_a Float
    #   expect(response).to have_key(:feels_like)
    #   expect(response[:feels_like]).to be_a Float
    #   expect(response).to have_key(:humidity)
    #   expect(response).to have_key(:uvi)
    #   expect(response[:uvi]).to be_a Float
    #   expect(response).to have_key(:visibility)
    #   expect(response[:visibility]).to be_an Integer
    #   expect(response).to have_key(:conditions)
    #   expect(response[:conditions]).to be_a String
    #   expect(response).to have_key(:icon)
    #   expect(response[:icon]).to be_a String
    # end
    #
    # xit 'builds hourly forecast from map location 8 hours', :vcr do
    #
    #   response = WeatherFacade.hourly_weather(@weather)
    #
    #   expect(response).to be_an Array
    #   expect(response.count).to eq 8
    #   response.each do |hour|
    #     expect(hour).to have_key(:time)
    #     expect(hour[:time]).to be_a String
    #     expect(hour).to have_key(:temperature)
    #     expect(hour[:temperature]).to be_a Float
    #     expect(hour).to have_key(:conditions)
    #     expect(hour[:conditions]).to be_a String
    #     expect(hour).to have_key(:icon)
    #     expect(hour[:icon]).to be_a String
    #   end
    # end
    #
    # xit 'builds a 5 day daily forecast from map location', :vcr do
    #
    #   response = WeatherFacade.daily_weather(@weather)
    #
    #   expect(response).to be_an Array
    #   expect(response.count).to eq 5
    #   response.each do |day|
    #     expect(day).to have_key(:date)
    #     expect(day[:date]).to be_a Date
    #     expect(day).to have_key(:sunrise)
    #     expect(day[:sunrise]).to be_a String
    #     expect(day).to have_key(:sunset)
    #     expect(day[:sunset]).to be_a String
    #     expect(day).to have_key(:max_temp)
    #     expect(day[:max_temp]).to be_a Float
    #     expect(day).to have_key(:min_temp)
    #     expect(day[:min_temp]).to be_a Float
    #     expect(day).to have_key(:conditions)
    #     expect(day[:conditions]).to be_a String
    #     expect(day).to have_key(:icon)
    #     expect(day[:icon]).to be_a String
    #   end
    # end
  end
end
