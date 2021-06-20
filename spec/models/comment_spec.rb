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
      subject { Comment.create_with_notification(user: user, project: project, params: params) }

      context 'when params are valid' do
        let(:params) { { body: 'My Comment' } }
        it 'creates comment' do
          expect { subject }.to change(Comment, :count).by(1)
        end

        it 'creates notification' do
          expect { subject }.to change(Notification, :count).by(1)
        end

        it 'should not have error information' do
          comment = subject
          expect(comment.errors).to be_empty
        end
      end

      context 'when params are invalid' do
        let(:params) { { body: '*' * 101 } }

        it 'does not create comment' do
          expect { subject }.not_to change(Comment, :count)
        end

        it 'does not create notification' do
          expect { subject }.not_to change(Notification, :count)
        end

        it 'should have error information' do
          comment = subject
          expect(comment.errors).not_to be_empty
        end
      end
    end
  end
end
