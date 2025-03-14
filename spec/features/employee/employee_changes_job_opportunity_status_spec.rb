require 'rails_helper'

feature 'Employee changes job opportunity status' do
  let!(:employee) { create(:employee) }
  let!(:job_opportunity) do
    create(:job_opportunity, job_title: 'Dummie', description: 'Auxiliar de eventos',
                             company: employee.company, status: 'active')
  end

  scenario 'inactivation' do
    login_as employee, scope: :employee
    visit job_opportunity_path(job_opportunity)
    page.find_link(title: 'Inativar vaga').click

    expect(current_path).to eq job_opportunity_path(job_opportunity)
    expect(job_opportunity.reload.status).to eq 'inactive'
    expect(page).to have_text('Inativa')
    expect(page).to have_link(title: 'Ativar vaga')
  end

  scenario 'activation' do
    job_opportunity.inactive!

    login_as employee, scope: :employee
    visit job_opportunity_path(job_opportunity)
    page.find_link(title: 'Ativar vaga').click

    expect(current_path).to eq job_opportunity_path(job_opportunity)
    expect(job_opportunity.reload.status).to eq 'active'
    expect(page).to have_text('Ativa')
    expect(page).to have_link(title: 'Inativar vaga')
  end
end
