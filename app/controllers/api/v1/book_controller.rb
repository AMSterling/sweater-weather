class Api::V1::BookController < ApplicationController
  def book_search
    books = BookFacade.destination_forecast(params[:location], params[:quantity])
    render json: BooksSerializer.new(books), status: status
  end
end
