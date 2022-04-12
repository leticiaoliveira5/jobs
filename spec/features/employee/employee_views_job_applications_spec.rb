require 'rails_helper'

feature 'Employee views job applications' do
  let(:candidate) { create(:candidate, firstname: 'Fernanda', surname: 'Braga') }
  let!(:apple) { create(:company, name: 'Apple', domain: 'apple.com', cnpj: '12345678911234') }
  let(:apple_employee) {  create(:employee, company: apple, email: 'employee@apple.com') }
  let!(:microsoft) do
    create(:company, name: 'Microsoft', domain: 'microsoft.com', cnpj: '12345678911235')
  end
  let(:microsoft_employee) do
    create(:employee, company: microsoft, email: 'employee01@microsoft.com')
  end
  let(:job_opportunity) do
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
  end

  before do
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
  end

  scenario 'successfully' do
    login_as apple_employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Desenvolvedor'

    expect(page).to have_content 'Candidaturas recebidas para esta vaga:'
    expect(page).to have_content 'Desenvolvedor - Fernanda Braga'
  end

  scenario 'only if belongs to company' do
    login_as microsoft_employee, scope: :employee
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    click_on 'Desenvolvedor'

    expect(page).not_to have_content 'Candidaturas recebidas para esta vaga:'
    expect(page).not_to have_link 'Inativar vaga'
    expect(page).not_to have_link 'Editar vaga'
  end
end
