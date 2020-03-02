require 'rails_helper'

describe 'landing page data' do
  it 'forecast information' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    result = JSON.parse(response.body)['data']
    require "pry"; binding.pry
  end

  it 'background endpoint' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    result = JSON.parse(response.body)['data']
    expect(result['attributes']['weather_image'].count).to eq(5)
  end
end
