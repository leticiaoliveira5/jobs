require 'rails_helper'

feature 'Employee edits job opportunity' do
  let!(:employee) { create(:employee) }
  let!(:job_opportunity) do
    create(:job_opportunity, job_title: 'Dummie',
                             description: 'Auxiliar de eventos',
                             company: employee.company,
                             status: 'active')
  end

  before do
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Dummie'
  end

  scenario 'inactivates and activates' do
    click_on 'Inativar vaga'

    expect(current_path).to eq job_opportunity_path(job_opportunity)
    expect(job_opportunity.reload.status).to eq 'inactive'
    expect(page).to have_text('Inativa')
    expect(page).to have_link('Ativar vaga')

    click_on 'Ativar vaga'

    expect(current_path).to eq job_opportunity_path(job_opportunity)
    expect(job_opportunity.reload.status).to eq 'active'
    expect(page).to have_text('Ativa')
    expect(page).to have_link('Inativar vaga')
  end
end
