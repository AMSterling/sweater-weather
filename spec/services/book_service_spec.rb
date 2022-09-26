require 'rails_helper'

RSpec.describe BookService do
  it 'gets books by location', :vcr do
    response = BookService.get_books('denver,co')
require "pry"; binding.pry
    expect(response).to be_a Hash
    expect(response.keys).to eq([:numFound, :start, :numFoundExact, :docs, :num_found, :q, :offset])
  end
end
