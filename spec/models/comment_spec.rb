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

  describe 'class methods' do
    describe '.create_with_notification' do
      let(:user) { create(:user) }
      let(:project) { create(:project) }
      let(:params) { { body: 'My Comment' } }
      subject { Comment.create_with_notification(user: user, project: project, params: params) }

      it 'creates project_support' do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it 'creates notification' do
        expect { subject }.to change(Notification, :count).by(1)
      end
    end
  end
end
