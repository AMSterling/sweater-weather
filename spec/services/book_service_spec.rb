require 'rails_helper'

RSpec.describe BookService, :vcr do
  it 'gets books by location' do
    response = BookService.get_books('denver,co', 5)

    expect(response).to be_a Hash
    expect(response.keys).to eq([:numFound, :start, :numFoundExact, :docs, :num_found, :q, :offset])
    expect(response[:numFound]).to be_an Integer
    expect(response[:docs].count).to eq 45
      response[:docs].each do |doc|
        expect(doc).to have_key(:title)
        expect(doc[:title].downcase).to include('denver')
        expect(doc.has_key?(:isbn))
        expect(doc.has_key?(:publisher))
      end
  end
end
