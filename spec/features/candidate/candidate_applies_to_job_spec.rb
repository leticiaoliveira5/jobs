require 'rails_helper'

feature 'Candidate applies to job' do
  let(:candidate) { create(:candidate) }
  let(:company) { create(:company) }

  before do
    create(:job_opportunity, job_title: 'Dummie', company: company)
  end

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on company.name
    click_on 'Dummie'
    click_on 'Inscrever-se nesta vaga'

    expect(page).to have_text 'Inscrição realizada com sucesso!'
    expect(candidate.job_applications.count).to eq(1)
  end

  scenario 'only once' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on company.name
    click_on 'Dummie'
    click_on 'Inscrever-se nesta vaga'

    expect(page).to have_text 'Você está inscrito nesta vaga'
    expect(page).not_to have_link 'Inscrever-se nesta vaga'
    expect(candidate.job_applications.count).to eq 1
  end

  scenario 'and cancels application' do
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
