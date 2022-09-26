class BookFacade
  def self.destination_forecast(location)
    locale = MapService.get_location(location)
    @forecast_data = WeatherService.get_weather(locale[:lat], locale[:lng])
    book_data = BookService.get_books(location)

    data = OpenStruct.new({
      id: nil,
      type: 'books',
      destination: get_destination(location),
      forecast: forecast_details_hash,
      total_books_found: book_data[:numFound],
      books: book_data[:docs].take(5)
      })
  end

  def self.get_destination(location)
    location
  end

  def self.forecast_details_hash
    forecast_details = {}
    forecast_details.store(:summary, @forecast_data[:current][:weather][0][:description])
    forecast_details.store(:temperature, @forecast_data[:current][:temp].to_s + ' F')
  end

  def self.book_details
    book_data[:docs].take(5).map do |doc|
      require "pry"; binding.pry
    end
  end
end
