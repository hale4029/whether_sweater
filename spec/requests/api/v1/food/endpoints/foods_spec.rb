require 'rails_helper'

describe 'munchies (aka foods)' do
  it 'shows data' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expected = {"id"=>nil,
                 "type"=>"food", #used food instead of munchies (don't like controllers that end in 's')
                 "attributes"=>
                  {"end_location"=>"pueblo,co",
                   "travel_time"=>"1 hour 48 mins",
                   "forecast"=>"Clear",
                   "restaurant"=>
                    {"name"=>"Kan's Kitchen",
                     "address"=>"1620 S Prairie Ave, Pueblo, CO 81005"}}}

    expect(response).to be_successful
    result = JSON.parse(response.body)['data']
    expect(result).to eq(expected)
  end
end
