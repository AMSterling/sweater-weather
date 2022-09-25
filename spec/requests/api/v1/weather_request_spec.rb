require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'gets current, hourly and daily weather for a location' do
    locale = 'lincoln,ne'
    get "/api/v1/forecast?location=#{locale}"

    expect(response).to be_successful

    # response_body = JSON.parse(response.body, symbolize_names: true)
    # weather = response_body[:data]
  end
end
