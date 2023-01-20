require 'rails_helper'

feature 'Candidate cancels job application' do
  let(:candidate) { create(:candidate) }
  let!(:job_opportunity) { create(:job_opportunity) }

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'
    within(".list-item##{job_opportunity.id}") do
      click_on 'Ver detalhes'
    end
    click_on 'Inscrever-se nesta vaga'
    click_on 'Cancelar candidatura'

    expect(candidate.job_applications.count).to eq(0)
    expect(page).to have_text 'Você não está mais inscrito nesta vaga'
  end
end
