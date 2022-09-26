class BookService
  def self.get_books(title)
    response = conn.get('search.json') do |faraday|
      faraday.params['q'] = q
    end
    data = parse(response)
  end


  private

  def self.conn
    connection = Faraday.new(url: 'http://openlibrary.org/')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
