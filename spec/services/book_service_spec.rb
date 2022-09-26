require 'rails_helper'

RSpec.describe BookService do
  it 'gets books by location', :vcr do
    response = BookService.get_books('denver,co')

    expect(response).to be_a Hash
    expect(response.keys).to eq([:numFound, :start, :numFoundExact, :docs, :num_found, :q, :offset])
    expect(response[:numFound]).to eq 38
    expect(response[:docs].count).to eq 38
      response[:docs].each do |doc|
        expect(doc).to have_key(:title)
        expect(doc[:title].downcase).to include('denver')
        expect(doc.has_key?(:isbn))
        expect(doc.has_key?(:publisher))
      end
  end
end
