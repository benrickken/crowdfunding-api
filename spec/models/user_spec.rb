require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'validation' do
    let(:user) { create(:user) }

    it 'is invalid without uid' do
      expect(build(:user, uid: nil)).to be_invalid
    end

    it 'is invalid without unique uid' do
      expect(build(:user, uid: user.uid)).to be_invalid
    end

    it 'is invalid without name' do
      expect(build(:user, name: nil)).to be_invalid
    end
  end
end
