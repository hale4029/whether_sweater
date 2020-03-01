require 'rails_helper'

describe 'landing page data' do
  it 'box 1 (top left)' do
    get '/api/v1/forecasts?location?denver,co'

    expect(response).to be_successful
    result = JSON.parse(response.body)['data']

    expect(result.keys).to include('high')
    expect(result.keys).to include('low')
    expect(result.keys).to include('current_temp')
    expect(result.keys).to include('location')
    expect(result.keys).to include('time')
    expect(result.keys).to include('date')
    expect(result.keys).to include('icon')
  end
end
