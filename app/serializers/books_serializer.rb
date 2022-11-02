class BooksSerializer
  include JSONAPI::Serializer
  # attributes :destination, :forecast, :total_books_found, :books
  def self.new(book)
    {
      data: {
        id: book.id,
        type: book.type,
        attributes: book.attributes
      }
    }
  end
end
