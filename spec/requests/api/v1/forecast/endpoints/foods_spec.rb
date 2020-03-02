require 'rails_helper'

describe 'munchies (aka foods)' do
  it 'shows data' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
    result = JSON.parse(response.body)['data']
  #  expect(result['attributes']['current_weather']).to_not eq(nil)
  #  expect(result['attributes']['daily_forecast']['data'].count).to eq(8)
    #expect(result['attributes']['hourly_forecast'].count).to eq(8)
  end
end
