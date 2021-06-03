require 'rails_helper'

RSpec.describe ProjectSupport, type: :model do
  describe 'create' do
    it 'is valid with validated parameters' do
      expect(build(:project_support)).to be_valid
    end
  end

  describe 'validation' do
    let(:user) { create(:user) }
    let(:project_return) { create(:project_return) }

    it 'is invalid without project_return_id' do
      expect(build(:project_support, project_return_id: nil)).to be_invalid
    end

    it 'is invalid without unique user_id and project_return_id' do
      create(:project_support, user: user, project_return: project_return)
      expect(build(:project_support, user: user, project_return: project_return)).to be_invalid
    end

    it 'is invalid without user_id' do
      expect(build(:project_support, user_id: nil)).to be_invalid
    end
  end

  describe 'class methods' do
    describe '.create_with_complete_check!' do
      let(:user) { create(:user) }
      let(:project_return) { create(:project_return) }
      let(:params) { { project_return_id: project_return.id } }
      subject { ProjectSupport.create_with_complete_check!(user: user, params: params) }

      it 'creates project_support' do
        expect { subject }.to change(ProjectSupport, :count).by(1)
      end
    end
  end
end
