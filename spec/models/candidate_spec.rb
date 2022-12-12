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
      it 'validates content type' do
        candidate = build(:candidate, :with_invalid_format_avatar)

        expect(candidate).to be_invalid
        expect(candidate.errors).to include(:avatar)
      end

      it 'validates size' do
        candidate = build(:candidate, :with_avatar)

        allow_any_instance_of(ActiveStorage::Blob).to receive(:byte_size).and_return(1.megabyte)

        expect(candidate).to be_invalid
        expect(candidate.errors).to include(:avatar)
      end
    end
  end
end
