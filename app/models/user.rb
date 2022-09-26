class User < ApplicationRecord
  validates_presence_of :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Must be valid email address' }
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_digest
  validates_confirmation_of :password
  has_secure_password

  has_many :api_keys, as: :bearer 
end
