# frozen_string_literal: true

require 'rails_helper'

feature 'Employee views job proposals sent' do
  scenario 'successfully' do
    # arrange
    employee = create(:employee)
    job_opportunity = create(:job_opportunity, job_title: 'Desenvolvedor', company: employee.company)
    candidate = create(:candidate, firstname: 'Juliana', surname: 'Fagundes')
    job_application = create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
    create(:job_proposal, job_application: job_application, job_opportunity: job_opportunity, candidate: candidate)
    # act
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    # assert
    expect(page).to have_content 'Propostas enviadas'
    expect(page).to have_link 'Desenvolvedor - Juliana Fagundes'
  end
end
