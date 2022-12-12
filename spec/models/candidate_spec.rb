require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:job_applications) }
    it { is_expected.to have_many(:job_proposals) }
    it { is_expected.to have_many(:work_experiences) }
    it { is_expected.to have_many(:candidate_skills) }
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:skills) }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:document) }

    context 'avatar' do
      let(:candidate) { build(:candidate) }

      it 'validates content type' do
        file = Rails.root.join('spec/fixtures/text.txt')
        txt = ActiveStorage::Blob.create_and_upload!(
          io: File.open(file, 'rb'),
          filename: 'text.txt',
          content_type: 'text/txt'
        ).signed_id

        candidate.avatar = txt
        expect(candidate).not_to be_valid
        expect(candidate.errors).to include(:avatar)
      end

      it 'validates size' do
        file = Rails.root.join('spec/fixtures/img.jpg')
        img = ActiveStorage::Blob.create_and_upload!(
          io: File.open(file, 'rb'),
          filename: 'img.jpg',
          content_type: 'image/jpeg'
        ).signed_id

        allow_any_instance_of(ActiveStorage::Blob).to receive(:byte_size).and_return(1.megabyte)

        candidate.avatar = img
        expect(candidate).not_to be_valid
        expect(candidate.errors).to include(:avatar)
      end
    end
  end
end
