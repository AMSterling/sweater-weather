require 'rails_helper'

RSpec.describe MapService do
  it 'gets the location', :vcr do
    response = MapService.get_location('denver,co')

    expect(response).to be_a Hash
    expect(response).to have_key(:lat)
    expect(response[:lat].round(2)).to eq(39.74)
    expect(response).to have_key(:lng)
    expect(response[:lng].round(2)).to eq(-104.99)
  end
end
