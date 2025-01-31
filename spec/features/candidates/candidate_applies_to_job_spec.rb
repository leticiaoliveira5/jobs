require 'rails_helper'

feature 'Candidate applies to job' do
  let(:candidate) { create(:candidate) }
  let!(:job_opportunity) { create(:job_opportunity) }

  before do
    login_as candidate, scope: :candidate
    visit root_path
    within('.nav') { click_on 'Vagas' }
    within("#job-#{job_opportunity.id}") do
      click_on 'Ver detalhes'
    end
  end

  scenario 'successfully' do
    click_on 'Inscrever-se nesta vaga'

    expect(page).to have_text 'Inscrição realizada com sucesso!'
    expect(candidate.job_applications.count).to eq(1)
  end

  scenario 'only once' do
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)

    visit current_path

    expect(page).not_to have_link 'Inscrever-se nesta vaga'
    expect(page).to have_button 'Cancelar candidatura'
  end
end
