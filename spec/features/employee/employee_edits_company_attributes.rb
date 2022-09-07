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
    click_on 'Área do colaborador'
    click_on 'Editar dados da empresa'
    fill_in 'Endereço', with: 'Rua 7, número 10, Glória'
    click_on 'Cadastrar empresa'

    expect(current_path).to eq company_path(employee.company)
    expect(page).to have_content 'Rua 7, número 10, Glória'
  end

  scenario 'if admin' do
    login_as regular_employee, scope: :employee
    visit root_path
    click_on 'Área do colaborador'

    expect(page).not_to have_content 'Editar dados da empresa'
  end
end
