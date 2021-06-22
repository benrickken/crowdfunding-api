require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:favorite)).to be_valid
    end
  end

  describe 'validation' do
    let(:user) { create(:user) }
    let(:project) { create(:project) }

    it 'is invalid without project_id' do
      expect(build(:favorite, project_id: nil)).to be_invalid
    end

    it 'is invalid without unique user_id and project_id' do
      create(:favorite, user: user, project: project)
      expect(build(:favorite, user: user, project: project)).to be_invalid
    end

    it 'is invalid without user_id' do
      expect(build(:favorite, user_id: nil)).to be_invalid
    end
  end
end
