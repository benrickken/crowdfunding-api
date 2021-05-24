require 'rails_helper'

RSpec.describe ProjectReturn, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:project_return)).to be_valid
    end
  end

  describe 'validation' do
    it 'is invalid without project' do
      expect(build(:project_return, project: nil)).to be_invalid
    end

    it 'is invalid without price' do
      expect(build(:project_return, price: nil)).to be_invalid
    end

    it 'is invalid without capacity' do
      expect(build(:project_return, capacity: nil)).to be_invalid
    end

    it 'is invalid without delivery_date' do
      expect(build(:project_return, delivery_date: nil)).to be_invalid
    end

    it 'is invalid without description' do
      expect(build(:project_return, description: nil)).to be_invalid
    end
  end
end
