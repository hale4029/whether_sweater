require 'rails_helper'

describe 'user registers' do
  it 'sends api key and 201 if successful' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'

    expect(response.status).to eq(201)
    result = JSON.parse(response.body)['data']
    expect(result['attributes'].keys).to include('api_key')
  end

  it 'sends 400 if failure with information' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworl&password_confirmation=helloworld'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body)
    expect(result['password_confirmation'][0]).to eq("doesn't match Password")
  end

  it 'sends 400 if failure with information' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body)
    expect(result['email'][0]).to eq("has already been taken")
  end
end
