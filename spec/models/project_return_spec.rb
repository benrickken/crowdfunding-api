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

  describe 'instance methods' do
    describe '#created_by?' do
      let(:user) { build(:user) }
      let(:project) { build(:project, user: user) }
      let(:project_return) { build(:project_return, project: project) }

      subject { project_return.created_by?(user) }

      context 'when user doesn\'t exist' do
        let(:user) { nil }
        it { is_expected.to eq(false) }
      end

      context 'when user exists but project is not created by user' do
        let(:user) { build(:user) }
        it { is_expected.to eq(true) }
      end

      context 'when project is created by user' do
        it { is_expected.to eq(true) }
      end
    end
  end
end
