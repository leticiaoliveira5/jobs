require 'rails_helper'

feature 'Employee edits company' do
  scenario 'successfully' do
    employee = create(:employee, role: :admin)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Editar dados da empresa'
    fill_in 'Endereço', with: 'Rua 7, número 10, Glória'
    click_on 'Cadastrar empresa'

    expect(current_path).to eq company_path(employee.company)
    expect(page).to have_content 'Rua 7, número 10, Glória'
  end
  scenario 'if admin' do
    first_employee = create(:employee, role: :admin)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'

    expect(page).not_to have_content 'Editar dados da empresa'
  end
end
