require 'rails_helper'

feature 'employee edits job opportunity' do
  scenario 'successfully' do
    employee = create(:employee)
    company = employee.company
    job_opportunity = create(:job_opportunity, job_title: 'Dummie',
                                               description: 'Auxiliar de eventos',
                                               company: company)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Dummie'
    click_on 'Editar vaga'
    fill_in 'Descrição', with: 'Auxiliar em diversas atividades, como organização de provas'
    fill_in 'Data limite', with: 2.months.from_now
    click_on 'Atualizar'

    expect(current_path).to eq job_opportunity_path(job_opportunity)
    expect(page).to have_content 'Globe'
    expect(page).to have_content 'Auxiliar em diversas atividades, como organização de provas'
  end
end