class BookFacade
  def self.destination_forecast(location)
  locale = MapService.get_location(location)
  forecast = WeatherService.get_weather(locale[:lat], locale[:lng])
  books = BookService.get_books(location)
  Books.new(books)
  end
end
