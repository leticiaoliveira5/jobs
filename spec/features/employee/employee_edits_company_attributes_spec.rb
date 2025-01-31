require 'rails_helper'

feature 'Employee edits company' do
  let!(:first_employee) { create(:employee, role: :admin) }
  let(:regular_employee) do
    create(:employee, role: :regular,
                      email: 'ana@globe.com',
                      company: first_employee.company)
  end

  scenario 'successfully' do
    login_as first_employee, scope: :employee
    visit root_path
    within('.nav') { click_on 'Área do colaborador' }
    click_on 'Editar dados da empresa'
    fill_in 'Nome', with: 'Novo nome'
    click_on 'Cadastrar empresa'

    expect(current_path).to eq company_path(first_employee.company.reload)
    expect(page).to have_content 'Novo nome'
  end

  scenario 'if admin' do
    login_as regular_employee, scope: :employee
    visit root_path
    within('.nav') { click_on 'Área do colaborador' }

    expect(page).not_to have_content 'Editar dados da empresa'
  end
end
