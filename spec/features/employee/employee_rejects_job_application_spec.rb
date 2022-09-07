require 'rails_helper'

feature 'Employee rejects job application' do
  let!(:employee) { create(:employee) }
  let!(:company) { employee.company }
  let(:job_opportunity) { create(:job_opportunity, company: company, job_title: 'Desenvolvedor') }
  let(:candidate) { create(:candidate, firstname: 'Fernanda', surname: 'Braga') }
  let!(:job_application) do
    create(:job_application, candidate: candidate,
                             job_opportunity: job_opportunity)
  end

  before { login_as employee, scope: :employee }

  scenario 'employee views job application' do
    visit root_path
    click_on 'Área do colaborador'
    click_on 'Desenvolvedor - Fernanda Braga'

    expect(current_path).to eq job_application_path(job_application)
    expect(page).to have_text('Rejeitar candidatura') &&
                    have_text('Dê um motivo para a rejeição da candidatura.')
    expect(page).to have_field 'rejection_motive'
  end

  scenario 'employee declines job application' do
    visit job_application_path(job_application)
    within('.reject-form') { click_on('Confirmar') }

    expect(current_path).to eq company_path(job_application.company)
    expect(page).to have_content 'A aplicação de Fernanda foi rejeitada'
    expect(job_application.reload.status).to eq 'declined'
  end
end
