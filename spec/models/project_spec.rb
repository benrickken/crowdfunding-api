require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:project)).to be_valid
    end
  end

  describe 'validation' do
    it 'is invalid without user_id' do
      expect(build(:project, user_id: nil)).to be_invalid
    end

    it 'is invalid without title' do
      expect(build(:project, title: nil)).to be_invalid
    end

    it 'is invalid without target_amount' do
      expect(build(:project, target_amount: nil)).to be_invalid
    end

    it 'is invalid without due_date' do
      expect(build(:project, due_date: nil)).to be_invalid
    end
  end
end
