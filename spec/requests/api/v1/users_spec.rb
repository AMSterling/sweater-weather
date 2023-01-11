require 'rails_helper'

RSpec.describe 'User accounts' do
  it 'sign-up' do
    user_params = ({
                email: Faker::Internet.safe_email,
                password: 'password',
                password_confirmation: 'password'
                })
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: user_params, as: :json
    body = JSON.parse(response.body, symbolize_names: true)
    created_user = User.last

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(body[:data]).to have_key(:id)
    expect(body[:data][:id].to_i).to eq(created_user.id)
    expect(body[:data]).to have_key(:type)
    expect(body[:data][:type]).to eq('users')
    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to have_key(:email)
    expect(body[:data][:attributes][:email]).to eq(created_user.email)
    expect(created_user.email).to eq(user_params[:email])
    expect(body[:data][:attributes]).to have_key(:api_key)
    expect(body[:data][:attributes][:api_key]).to be_a String
    expect(created_user.password_digest).to be_a String
    expect(created_user.api_key).to be_a String
  end

  it 'cannot create account if passwords mismatched' do
    user_params = ({
                email: Faker::Internet.safe_email,
                password: 'password',
                password_confirmation: 'badpassword123'
                })
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: user_params, as: :json

    expect(response).to have_http_status(422)
    expect(response.body).to eq("{\"error\":\"Passwords do not match\"}")
    expect(response.body).to include('Passwords do not match')
  end

  it 'cannot create account if email is already taken' do
    user_params = ({
                email: 'some@example.com',
                password: 'password',
                password_confirmation: 'password'
                })
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: user_params, as: :json
    body = JSON.parse(response.body, symbolize_names: true)
    created_user = User.last

    new_user_params = ({
                email: 'some@example.com',
                password: 'password',
                password_confirmation: 'password'
                })
    post '/api/v1/users', headers: headers, params: JSON.generate(new_user_params)

    expect(response).to have_http_status(422)
    expect(response.body).to include('Email has already been taken')
  end
end
