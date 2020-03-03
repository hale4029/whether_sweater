class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  #validates_presence_of :auth_token, uniqueness: true, require: true

  has_secure_password
  has_secure_token :auth_token

  def api_key
    self.auth_token
  end

  private

  # def decrypt
  #   self.auth_token
  # end
end
