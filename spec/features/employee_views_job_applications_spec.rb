# frozen_string_literal: true

require 'rails_helper'

feature 'Employee views job applications' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee)
    company = employee.company
    job_opportunity = create(:job_opportunity, company: company, job_title: 'Desenvolvedor')
    candidate = create(:candidate, firstname: 'Fernanda', surname: 'Braga')
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
    # act
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Desenvolvedor'
    # assert
    expect(page).to have_content 'Candidaturas recebidas para esta vaga:'
    expect(page).to have_content 'Desenvolvedor - Fernanda Braga'
  end

  scenario 'only if belongs to company' do
    # arrange
    apple = create(:company, name: 'Apple', domain: 'apple.com', cnpj: '12345678911234')
    microsoft = create(:company, name: 'Microsoft', domain: 'microsoft.com', cnpj: '12345678911235')
    microsoft_employee = create(:employee, company: microsoft, email: 'employee01@microsoft.com')
    job_opportunity = create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
    create(:job_application, job_opportunity: job_opportunity)
    # act
    login_as microsoft_employee
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    click_on 'Desenvolvedor'
    # assert
    expect(page).not_to have_content 'Candidaturas recebidas para esta vaga:'
    expect(page).not_to have_link 'Inativar vaga'
    expect(page).not_to have_link 'Editar vaga'
  end
end
