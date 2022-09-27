class User < ApplicationRecord
  validates_presence_of :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }
  validates_uniqueness_of :email, case_sensitive: false
  has_secure_password

  has_many :api_keys, as: :bearer

  def api_key
    api_key = self.api_keys.create! token: SecureRandom.hex
    api_key[:token]
  end
end
