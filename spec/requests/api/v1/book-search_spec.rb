require 'rails_helper'

RSpec.describe 'Book Search' do
  it 'returns weather, destination and 5 related books', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    books = response_body[:data]

    expect(books.keys).to eq([:id, :type, :attributes])
    expect(books[:id]).to eq nil
    expect(books[:type]).to eq('books')
    expect(books[:attributes].keys).to eq([:destination, :forecast, :total_books_found, :books])
    expect(books[:attributes][:destination]).to eq('denver,co')
    expect(books[:attributes][:forecast]).to be_a Hash
    expect(books[:attributes][:forecast].keys).to eq([:summary, :temperature])
    expect(books[:attributes][:total_books_found]).to eq 39
    expect(books[:attributes][:books]).to be_an Array
    expect(books[:attributes][:books].count).to eq 5
    books[:attributes][:books].each do |book|
      expect(book.keys).to eq([:isbn, :title, :publisher])
      expect(book[:isbn]).to be_an Array
      expect(book[:title].downcase).to include('denver')
      expect(book[:publisher]).to be_an Array
    end
    expect(response_body).to eq(
      {:data=>{
        :id=>nil,
        :type=>"books",
        :attributes=>{
          :destination=>"denver,co",
          :forecast=>{
            :summary=>"broken clouds",
            :temperature=>"54.27 F"
          },
          :total_books_found=>39,
          :books=>[
            {
              :isbn=>["0762507845","9780762507849"],
              :title=>"Denver, Co",
              :publisher=>["Universal Map Enterprises"]
            },
            {
              :isbn=>["9780607620054", "0607620056"],
              :title=>"Denver west, CO and Bailey, CO: Denver, CO",
              :publisher=>["USGS Branch of Distribution"]
            },
            {
              :isbn=>["9780607620047", "0607620048"],
              :title=>"Denver East, CO and Castle Rock, CO: Denver, CO",
              :publisher=>["USGS Branch of Distribution"]
            },
            {
              :isbn=>["0762557362", "9780762557363"],
              :title=>"Denver Co Deluxe Flip Map",
              :publisher=>["Universal Map Enterprises"]
            },
            {
              :isbn=>["9781427401687", "1427401683"],
              :title=>"University of Denver Co 2007",
              :publisher=>["College Prowler"]
            }
          ]
        }
      }
    }
    )
  end
end
