# frozen_string_literal: true

require 'rails_helper'

feature 'Employee rejects job application' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee)
    company = employee.company
    job_opportunity = create(:job_opportunity, company: company, job_title: 'Desenvolvedor')
    candidate = create(:candidate, firstname: 'Fernanda', surname: 'Braga')
    job_application = create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
    # act
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Desenvolvedor - Fernanda Braga'
    # assert
    expect(current_path).to eq job_application_path(job_application)
    expect(page).to have_text 'Rejeitar candidatura'
    expect(page).to have_text 'Dê um motivo para a rejeição da candidatura.'
    expect(page).to have_field 'rejection_motive'
  end
end
