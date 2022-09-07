require 'rails_helper'

feature 'Employee views job proposals sent' do
  let!(:employee) { create(:employee) }
  let!(:candidate) { create(:candidate, firstname: 'Juliana', surname: 'Fagundes') }
  let!(:job_opportunity) do
    create(:job_opportunity, job_title: 'Desenvolvedor',
                             company: employee.company)
  end
  let(:job_application) do
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
  end

  before do
    create(:job_proposal, job_application: job_application,
                          job_opportunity: job_opportunity,
                          candidate: candidate)
  end

  scenario 'successfully' do
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área do colaborador'

    expect(page).to have_content 'Propostas enviadas'
  end
end
