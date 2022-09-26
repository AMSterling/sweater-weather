require 'rails_helper'

RSpec.describe BookFacade do
  it 'is books that contain Denver, CO in title and weather', :vcr do
    response = BookFacade.destination_forecast('denver,co')

    expect(response.id).to be_nil
  end
end
