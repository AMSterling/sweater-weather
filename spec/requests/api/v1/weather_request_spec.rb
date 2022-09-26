require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'gets current, hourly and daily weather for a location', :vcr do
    location = 'lincoln,ne'
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    weather = response_body[:data]

    expect(weather.keys).to eq([:id, :type, :attributes])
    expect(weather[:id]).to be_nil
    expect(weather[:type]).to eq('forecast')
    expect(weather[:attributes]).to be_a Hash
    expect(weather[:attributes].count).to eq 3
    expect(weather[:attributes]).to have_key(:current_weather)
    expect(weather[:attributes][:current_weather]).to be_a Hash
    expect(weather[:attributes][:current_weather].keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
    expect(weather[:attributes]).to have_key(:daily_weather)
    expect(weather[:attributes][:daily_weather]).to be_an Array
    expect(weather[:attributes][:daily_weather].count).to eq 5
      weather[:attributes][:daily_weather].each do |day|
        expect(day.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
      end
    expect(weather[:attributes]).to have_key(:hourly_weather)
    expect(weather[:attributes][:hourly_weather]).to be_an Array
    expect(weather[:attributes][:hourly_weather].count).to eq 8
      weather[:attributes][:hourly_weather].each do |hour|
        expect(hour.keys).to eq([:time, :temperature, :conditions, :icon])
      end
  end
end
