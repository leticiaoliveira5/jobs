require 'rails_helper'

feature 'employee registers job opportunity' do
  scenario 'successfully' do
    employee = create(:employee)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Cadastrar nova vaga'
    fill_in 'Título da vaga', with: 'Ator'
    fill_in 'Faixa salarial', with: 'A combinar'
    within '.select_level' do
      select 'Pleno'
    end
    fill_in 'Local', with: 'Curicica, Rio de Janeiro'
    fill_in 'Descrição', with: 'Atuar em novelas da emissora'
    fill_in 'Data limite', with: 2.months.from_now
    fill_in 'Número de vagas', with: '2'
    click_on 'Cadastrar vaga'

    expect(page).to have_content 'Globe'
    expect(page).to have_content 'Descrição'
    expect(page).to have_content 'Atuar em novelas da emissora'
    expect(employee.company.job_opportunities.count).to eq(1)
  end

  scenario 'only if belongs to company' do
    company = create(:company, domain: 'g1.com', cnpj: '12345678911234')
    company_employee = create(:employee, company: company)
    another_company = create(:company, name: 'Record', domain: 'r7.com', cnpj: '12345678911235')
    create(:employee, email: 'andrea@r7.com', company: another_company)

    login_as company_employee, scope: :employee
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Record'

    expect(page).not_to have_content 'Registrar nova vaga'
    expect(page).not_to have_content 'Editar dados da empresa'
    expect(page).not_to have_content 'Painel do colaborador'
  end

  scenario 'only if all fields are filled' do
    employee = create(:employee)

    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Cadastrar nova vaga'
    fill_in 'Título da vaga', with: 'Atriz'
    click_on 'Cadastrar vaga'

    expect(JobOpportunity.count).to eq(0)
    expect(page).to have_content 'Descrição não pode ficar em branco'
    expect(page).to have_content 'Nível não pode ficar em branco'
    expect(page).to have_content 'Faixa salarial não pode ficar em branco'
    expect(page).to have_content 'Local não pode ficar em branco'
    expect(page).to have_content 'Data limite não pode ficar em branco'
  end
end
