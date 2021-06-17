require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:notification)).to be_valid
    end
  end

  describe 'validation' do
    let(:notification) { create(:notification) }

    it 'is invalid without body' do
      expect(build(:notification, body: nil)).to be_invalid
    end

    it 'is invalid without status' do
      expect(build(:notification, status: nil)).to be_invalid
    end
  end
end
