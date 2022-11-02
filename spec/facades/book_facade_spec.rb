require 'rails_helper'

RSpec.describe BookFacade do
  it 'is books that contain Denver, CO in title and weather', :vcr do
    response = BookFacade.destination_forecast('denver,co', 5)

    expect(response).to be_an OpenStruct
    expect(response.id).to be_nil
    expect(response.type).to eq('books')
    expect(response.attributes).to be_a Hash
    expect(response.attributes).to have_key(:destination)
    expect(response.attributes[:destination]).to eq('denver,co')
    expect(response.attributes).to have_key(:forecast)
    expect(response.attributes[:forecast]).to be_a Hash
    expect(response.attributes[:forecast]).to have_key(:summary)
    expect(response.attributes[:forecast][:summary]).to be_a String
    expect(response.attributes[:forecast]).to have_key(:temperature)
    expect(response.attributes[:forecast][:temperature]).to be_a String
    expect(response.attributes).to have_key(:total_books_found)
    expect(response.attributes).to have_key(:books)
    expect(response.attributes[:books].count).to eq 5
    response.attributes[:books].each do |book|
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_an Array
      expect(book).to have_key(:title)
      expect(book[:title]).to be_a String
      expect(book[:title].downcase).to include('denver')
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an Array
    end
    # expect(response).to be_an OpenStruct
    # expect(response.data[:id]).to be_nil
    # expect(response.data[:type]).to eq('books')
    # expect(response.data[:attributes]).to be_a Hash
    # expect(response.data[:attributes]).to have_key(:destination)
    # expect(response.data[:attributes][:destination]).to eq('denver,co')
    # expect(response.data[:attributes]).to have_key(:forecast)
    # expect(response.data[:attributes][:forecast]).to be_a Hash
    # expect(response.data[:attributes][:forecast]).to have_key(:summary)
    # expect(response.data[:attributes][:forecast][:summary]).to be_a String
    # expect(response.data[:attributes][:forecast]).to have_key(:temperature)
    # expect(response.data[:attributes][:forecast][:temperature]).to be_a String
    # expect(response.data[:attributes]).to have_key(:total_books_found)
    # expect(response.data[:attributes]).to have_key(:books)
    # expect(response.data[:attributes][:books].count).to eq 5
    # response.data[:attributes][:books].each do |book|
    #   expect(book).to have_key(:isbn)
    #   expect(book[:isbn]).to be_an Array
    #   expect(book).to have_key(:title)
    #   expect(book[:title]).to be_a String
    #   expect(book[:title].downcase).to include('denver')
    #   expect(book).to have_key(:publisher)
    #   expect(book[:publisher]).to be_an Array
    # end
  end
end
