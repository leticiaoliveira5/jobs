require 'rails_helper'

feature 'employee edits job opportunity' do
  let!(:employee) { create(:employee) }
  let(:company) { employee.company }

  before do
    create(:job_opportunity, job_title: 'Dummie',
                             description: 'Auxiliar de eventos',
                             company: company)
  end

  scenario 'successfully' do
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Dummie'
    click_on 'Editar vaga'
    fill_in 'Descrição', with: 'Auxiliar em organização de provas'
    click_on 'Atualizar'

    expect(current_path).to eq job_opportunity_path(JobOpportunity.last)
    expect(JobOpportunity.last.description).to eq 'Auxiliar em organização de provas'
  end
end
