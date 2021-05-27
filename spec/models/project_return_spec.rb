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
    describe '#supported_by?' do
      let(:user) { create(:user) }
      let(:project_return) { create(:project_return) }

      subject { project_return.supported_by?(user) }

      context 'when user doesn\'t exist' do
        let(:user) { nil }
        it { is_expected.to eq(false) }
      end

      context 'when user exists but project_return is not supported by user' do
        before do
          create(:project_support, project_return: project_return)
        end
        it { is_expected.to eq(false) }
      end

      context 'when project_return is supported by user' do
        before do
          create(:project_support, project_return: project_return, user: user)
        end
        it { is_expected.to eq(true) }
      end
    end
  end
end
