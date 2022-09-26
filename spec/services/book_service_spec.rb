require 'rails_helper'

RSpec.describe BookService do
  it 'gets books by location', :vcr do
    response = BookService.get_books('denver,co')
require "pry"; binding.pry
    expect(response).to be_a Hash
  end
end
