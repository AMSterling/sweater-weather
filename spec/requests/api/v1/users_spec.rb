require 'rails_helper'

RSpec.describe 'User accounts' do
  it 'sign-up' do
    user_params = ({
                email: Faker::Internet.safe_email,
                password: 'password',
                password_confirmation: 'password'
                })
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
    created_user = User.last

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(created_user.email).to eq(user_params[:email])
  end
end
