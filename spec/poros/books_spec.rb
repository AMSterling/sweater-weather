require 'rails_helper'

RSpec.describe Books do
  it 'exists' do
    response = BookFacade.destination_forecast('denver,co')

    expect(response.id).to be_nil
    expect(response.destination).to eq('denver,co')
  end
end
