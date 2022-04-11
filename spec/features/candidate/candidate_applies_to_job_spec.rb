require 'rails_helper'

feature 'Candidate applies to job' do
  scenario 'successfully' do
    company = create(:company, name: 'Globe')
    create(:job_opportunity, job_title: 'Dummie', company: company)
    candidate = create(:candidate)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Globe'
    click_on 'Dummie'
    click_on 'Inscrever-se nesta vaga'

    expect(page).to have_text 'Inscrição realizada com sucesso!'
    expect(JobApplication.count).to eq(1)
  end

  scenario 'only once' do
    company = create(:company, name: 'Globe')
    job_opportunity = create(:job_opportunity, company: company, job_title: 'Dummie')
    candidate = create(:candidate)
    JobApplication.create(candidate: candidate, job_opportunity: job_opportunity)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Globe'
    click_on 'Dummie'

    expect(JobApplication.count).to eq(1)
    expect(page).to have_text 'Você está inscrito nesta vaga'
    expect(page).not_to have_link 'Inscrever-se nesta vaga'
  end

  scenario 'and cancels application' do
    company = create(:company, name: 'Globe')
    create(:job_opportunity, company: company, job_title: 'Dummie')
    candidate = create(:candidate)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Dummie'
    click_on 'Inscrever-se nesta vaga'
    click_on 'Área do candidato'
    click_on 'Dummie'
    click_on 'Cancelar candidatura'

    expect(candidate.job_applications.count).to eq(0)
    expect(page).to have_text 'Você não está mais inscrito nesta vaga'
  end
end