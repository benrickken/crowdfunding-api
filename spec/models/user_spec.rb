require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'validation' do
    it 'is invalid without uid' do
      expect(build(:user, uid: nil)).to be_invalid
    end

    it 'is invalid without unique uid' do
      create(:user, uid: 'fca4b00f-1d50-4c71-bca5-51503b692bf6')
      expect(build(:user, uid: 'fca4b00f-1d50-4c71-bca5-51503b692bf6')).to be_invalid
    end

    it 'is invalid without name' do
      expect(build(:user, name: nil)).to be_invalid
    end
  end
end
