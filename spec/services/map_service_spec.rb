require 'rails_helper'

RSpec.describe MapService do
  it 'gets the location', :vcr do
    response = MapService.get_location('denver,co')

    expect(response).to be_a Hash
    expect(response).to have_key(:lat)
    expect(response[:lat]).to eq(39.74001)
    expect(response).to have_key(:lng)
    expect(response[:lng]).to eq(-104.99202)
  end
end
