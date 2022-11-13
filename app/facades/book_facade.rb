class BookFacade
  def self.destination_forecast(location, quantity)
    locale = MapService.get_location(location)
    @forecast_data = WeatherService.get_weather(locale[:lat], locale[:lng])
    @book_data = BookService.get_books(location, quantity)

    data = OpenStruct.new({
      id: nil,
      type: 'books',
      attributes: {
        destination: location,
        forecast: forecast_details,
        total_books_found: @book_data[:numFound],
        books: book_details(location, quantity)
      }})
  end

  def self.forecast_details
    forecast_details_hash = {
      summary: @forecast_data[:current][:weather][0][:description],
      temperature: @forecast_data[:current][:temp].to_s + ' F'
    }
  end

  def self.book_details(location, quantity)
    @book_data[:docs].take(quantity.to_i).map do |doc|
      book_details_hash = {
        isbn: doc[:isbn],
        title: doc[:title],
        publisher: doc[:publisher]
      }
    end
  end
end

# forecast_details.store(:summary, @forecast_data[:current][:weather][0][:description])
# forecast_details.store(:temperature, @forecast_data[:current][:temp].to_s + ' F')
