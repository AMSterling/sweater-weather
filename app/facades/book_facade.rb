class BookFacade
  def self.destination_forecast(location)
    locale = MapService.get_location(location)
    forecast = WeatherService.get_weather(locale[:lat], locale[:lng])
    books = BookService.get_books(location)

    data = OpenStruct.new({
      id: nil,
      type: 'books',
      destination: get_destination(location),
      :forecast => {
        summary: forecast[:current][:weather][0][:description],
        temperature: forecast[:current][:temp].to_s + 'F'
      }
      })
      require "pry"; binding.pry
  end

  def self.get_destination(location)
    location
  end

end
