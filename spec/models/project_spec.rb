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

    it 'is invalid without progress' do
      expect(build(:project, progress: nil)).to be_invalid
    end
  end

  describe 'instance methods' do
    let(:project) { build(:project) }

    describe '#image_url' do
      subject { project.image_url }

      context 'when image is empty' do
        it { is_expected.to eq(nil) }
      end

      context 'when image is not empty' do
        before do
          project.image = fixture_file_upload('spec/fixtures/example.svg')
        end

        it { is_expected.to match(%r{^http://localhost:3001/rails/active_storage/blobs/redirect/.*/example.svg}) }
      end
    end

    describe '#supported_amount' do
      before do
        project_return1 = create(:project_return, project: project, price: 10_000)
        project_return2 = create(:project_return, project: project, price: 20_000)
        project_return3 = create(:project_return, project: project, price: 30_000)
        create(:project_support, project_return: project_return1)
        create(:project_support, project_return: project_return1)
        create(:project_support, project_return: project_return2)
        create(:project_support, project_return: project_return3)
      end

      subject { project.supported_amount }
      it { is_expected.to eq(70_000) }
    end

    describe '#created_by?' do
      let(:user) { create(:user) }

      subject { project.created_by?(user) }

      context 'when user doesn\'t exist' do
        let(:user) { nil }
        it { is_expected.to eq(false) }
      end

      context 'when user exists but project is not created by user' do
        it { is_expected.to eq(false) }
      end

      context 'when project is created by user' do
        let(:project) { create(:project, user: user) }
        it { is_expected.to eq(true) }
      end
    end

    describe '#update_if_complete!' do
      let(:project) { create(:project, target_amount: 10_000, progress: 'incomplete') }
      subject { project.update_if_complete! }

      context 'when supported_amount reaches target_amount' do
        before do
          project_return = create(:project_return, project: project, price: 10_000)
          create(:project_support, project_return: project_return)
        end

        it 'changes project progress to completed' do
          expect { subject }.to change(project, :progress).to('completed')
        end

        it 'changes project completed_at to current time' do
          expect { subject }.to change(project, :completed_at).to be_within(1.second).of(Time.zone.now)
        end
      end

      context 'when supported_amount has not reached target_amount' do
        it 'keeps project progress incomplete' do
          expect { subject }.not_to change(project, :progress)
        end
      end
    end
  end
end
