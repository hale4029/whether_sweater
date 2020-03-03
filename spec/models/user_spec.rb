require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    #it {should validate_presence_of(:auth_token)}
    #it {should validate_uniqueness_of(:auth_token)}
  end
end
