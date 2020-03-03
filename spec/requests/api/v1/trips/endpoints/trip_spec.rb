require 'rails_helper'

describe 'return trip details' do
  xit 'successful' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'
    key = JSON.parse(response.body)['data']['attributes']['api_key']
    post('/api/v1/road_trip', params: {
                            origin: "Denver,CO",
                            destination: "Pueblo,CO",
                            api_key: "#{key}" })

    expect(response.status).to eq(200)
    result = JSON.parse(response.body)['data']['attributes']
    expect(result['origin']).to eq('Denver,CO')
    expect(result['destination']).to eq('Pueblo,CO')
    expect(result['travel_time']).to include("1 hour 48 mins")
    expect(result.keys).to include('arrival_forecast')
  end

  it 'unsuccessful (invalid key)' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'
    key = JSON.parse(response.body)['data']['attributes']['api_key']
    post('/api/v1/road_trip', params: {
                            origin: "Denver,CO",
                            destination: "Pueblo,CO",
                            api_key: "#{key}1" })

    expect(response.status).to eq(401)
    result = JSON.parse(response.body)
    expect(result['message']).to eq('Invalid Key')
  end
end
