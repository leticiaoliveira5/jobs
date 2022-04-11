require 'rails_helper'

feature 'Employee views job proposals sent' do
  let!(:employee) { create(:employee) }
  let(:candidate) { create(:candidate, firstname: 'Juliana', surname: 'Fagundes') }
  let(:job_opportunity) do
    create(:job_opportunity, job_title: 'Desenvolvedor',
                             company: employee.company)
  end

  before do
    create(:job_proposal, job_application: job_application,
                          job_opportunity: job_opportunity,
                          candidate: candidate)
  end

  scenario 'successfully' do
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'

    expect(page).to have_content 'Propostas enviadas'
    expect(page).to have_link 'Desenvolvedor - Juliana Fagundes'
  end
end
