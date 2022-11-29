require 'rails_helper'

feature 'Employee views job applications' do
  let!(:apple) { create(:company, name: 'Apple', domain: 'apple.com') }
  let(:apple_employee) { create(:employee, company: apple, email: 'employee@apple.com') }
  let!(:microsoft) { create(:company, name: 'Microsoft', domain: 'microsoft.com') }
  let(:microsoft_employee) { create(:employee, company: microsoft) }
  let(:job_opportunity) { create(:job_opportunity, company: apple, job_title: 'Desenvolvedor') }
  let!(:job_application) { create(:job_application, job_opportunity: job_opportunity) }

  scenario 'successfully' do
    login_as apple_employee, scope: :employee
    visit job_opportunity_path(job_opportunity)

    expect(page).to have_content 'Candidaturas recebidas para esta vaga:'
    expect(page).to have_content "Desenvolvedor - #{job_application.candidate.full_name}"
  end

  scenario 'only if belongs to company' do
    login_as microsoft_employee, scope: :employee
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    within(".job-preview-box##{job_opportunity.id}") do
      click_on 'Ver detalhes'
    end

    expect(page).not_to have_text 'Candidaturas recebidas para esta vaga:'
    expect(page).not_to have_link 'Inativar vaga'
    expect(page).not_to have_link 'Editar vaga'
  end
end
