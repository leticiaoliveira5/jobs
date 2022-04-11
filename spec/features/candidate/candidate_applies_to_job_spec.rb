require 'rails_helper'

feature 'Candidate applies to job' do
  let(:job_opportunity) { create(:job_opportunity, job_title: 'Dummie') }

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on job_opportunity.company.name
    click_on job_opportunity.job_title
    click_on 'Inscrever-se nesta vaga'

    expect(page).to have_text 'Inscrição realizada com sucesso!'
    expect(candidate.job_applications.count).to eq(1)
  end

  scenario 'only once' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on job_opportunity.job_title
    click_on 'Inscrever-se nesta vaga'
    visit current_path

    expect(page).to have_text 'Você está inscrito nesta vaga'
    expect(page).not_to have_link 'Inscrever-se nesta vaga'
  end

  scenario 'and cancels application' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on job_opportunity.job_title
    click_on 'Inscrever-se nesta vaga'
    click_on 'Área do candidato'
    click_on job_opportunity.job_title
    click_on 'Cancelar candidatura'

    expect(candidate.job_applications.count).to eq(0)
    expect(page).to have_text 'Você não está mais inscrito nesta vaga'
  end
end
