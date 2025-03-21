require 'rails_helper'

feature 'Employee edits job opportunity' do
  let!(:employee) { create(:employee) }
  let(:company) { employee.company }
  let!(:job_opportunity) do
    create(:job_opportunity, job_title: 'Dummie',
                             description: 'Auxiliar de eventos',
                             company: company)
  end

  scenario 'successfully' do
    login_as employee, scope: :employee
    visit job_opportunity_path(job_opportunity)
    click_on 'Editar vaga'
    fill_in 'Descrição', with: 'Auxiliar em organização de provas'
    click_on 'Atualizar'

    expect(current_path).to eq job_opportunity_path(job_opportunity)
    expect(job_opportunity.reload.description).to eq 'Auxiliar em organização de provas'
  end
end
