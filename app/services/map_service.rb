class MapService
  def self.get_location(location)
    response = conn.get("/geocoding/v1/address?location=#{location}") do |faraday|
      # faraday.params['location'] = location
    end
    # return { 'lat:' 39.74001, 'lng:' -104.99202 } if response.env.
    # data = parse(response)[:results][0][:locations][0][:latLng]
    data = JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end


  private

  def self.conn
    connection = Faraday.new(url: 'http://www.mapquestapi.com', params: { key: ENV['map_api_key']})
  end

  # def self.parse(response)
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end
