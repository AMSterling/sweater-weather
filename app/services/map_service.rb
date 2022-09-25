class MapService
  def self.get_location(location)
    response = conn.get('/geocoding/v1/address') do |faraday|
      faraday.params['location'] = location
    end
    data = parse(response)[:results][0][:locations][0][:latLng]
  end


  private

  def self.conn
    connection = Faraday.new(url: 'http://www.mapquestapi.com', params: { key: ENV['map_api_key']})
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
