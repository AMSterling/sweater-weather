require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:api_keys) }
  end
end
