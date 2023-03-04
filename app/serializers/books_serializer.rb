class BooksSerializer
  include JSONAPI::Serializer
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
