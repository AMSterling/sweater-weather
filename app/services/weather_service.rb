class WeatherService
  def self.get_weather(lat, lon)
    response = conn.get('/data/2.5/onecall') do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = lon
      faraday.params['units'] = 'imperial'
      faraday.params['exclude'] = 'minutely,alerts'
    end
    data = parse(response)
  end


  private

  def self.conn
    connection = Faraday.new(url: 'http://api.openweathermap.org/', params: { appid: ENV['weather_api_key']})
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
