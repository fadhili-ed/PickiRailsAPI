require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :password_digest }
  end

  describe 'valid attributes' do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it 'expects email to be valid' do
      email = User.new(name: 'jon doe', email: 'jondoe@gmail.com')
      expect(email).to be_valid
    end
    it 'does not allow invalid email' do
      invalid_email = User.new(name: 'jon doe', email: 'jondoe.com')
      expect(invalid_email).to_not be_valid
    end
  end
end
