require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:comment)).to be_valid
    end
  end

  describe 'validation' do
    let(:comment) { create(:comment) }

    it 'is invalid without body' do
      expect(build(:comment, body: nil)).to be_invalid
    end
  end
end
