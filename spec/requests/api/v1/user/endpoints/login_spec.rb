require 'rails_helper'

describe 'user logs in' do
  it 'sends api key and 200 if successful' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'
    post '/api/v1/sessions?email=harrison483@gmail.com&password=helloworld'

    expect(response.status).to eq(200)
    result = JSON.parse(response.body)['data']
    expect(result['attributes'].keys).to include('api_key')
  end

  it 'uncesuccessful login' do
    post '/api/v1/users?email=harrison483@gmail.com&password=helloworld&password_confirmation=helloworld'
    post '/api/v1/sessions?email=harrison482@gmail.com&password=helloworld'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body)
    expect(result['message']).to eq('invalid request')
  end
end
