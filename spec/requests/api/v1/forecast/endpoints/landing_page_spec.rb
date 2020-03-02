require 'rails_helper'

describe 'landing page data' do
  it 'forecast information' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    result = JSON.parse(response.body)['data']
    expect(result['attributes']['current_weather']).to_not eq(nil)
    expect(result['attributes']['daily_forecast']['data'].count).to eq(8)
  end

  it 'background endpoint' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body)['data']
    expect(result['attributes']['weather_image'].count).to eq(5)
  end
end
