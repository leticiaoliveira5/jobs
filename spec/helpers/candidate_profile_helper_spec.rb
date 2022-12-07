require 'rails_helper'

RSpec.describe CandidateProfileHelper, type: :helper do
  describe '#delete_path' do
    let(:course) { create(:course) }
    let(:work_experience) { create(:work_experience) }
    let(:language) { create(:language) }
    let(:candidate_skill) { create(:candidate_skill) }
    let(:degree) { create(:degree) }

    it { expect(delete_path(course)).to eq(course_path(course)) }
    it { expect(delete_path(work_experience)).to eq(work_experience_path(work_experience)) }
    it { expect(delete_path(language)).to eq(language_path(language)) }
    it { expect(delete_path(candidate_skill)).to eq(candidate_skill_path(candidate_skill)) }
    it { expect(delete_path(degree)).to eq(degree_path(degree)) }
  end

  describe '#degree_headline' do
    it { expect(degree_headline('titulo', 'mestrado')).to eq('<b>titulo</b> (mestrado)') }
    it { expect(degree_headline('titulo', nil)).to eq('<b>titulo</b>') }
  end

  describe '#graduation_year' do
    it { expect(graduation_year(2005)).to eq('Ano de conclusão: 2005') }
  end
end
