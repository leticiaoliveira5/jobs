# frozen_string_literal: true

require 'rails_helper'

feature 'Employee edits company' do
  let!(:first_employee) { create(:employee, role: :admin) }
  let(:regular_employee) { create(:employee, role: :regular, company: first_employee.company) }

  scenario 'if is company admin' do
    login_as first_employee, scope: :employee
    visit root_path
    within('.nav') { click_on 'Área do colaborador' }
    click_on 'Editar dados da empresa'
    fill_in 'Nome', with: 'Novo nome'
    click_on 'Cadastrar empresa'

    expect(current_path).to eq company_path(first_employee.company.reload)
    expect(page).to have_content 'Novo nome'
  end

  scenario '(not available for regular employee)' do
    login_as regular_employee, scope: :employee
    visit root_path
    within('.nav') { click_on 'Área do colaborador' }

    expect(page).not_to have_content 'Editar dados da empresa'
  end
end
