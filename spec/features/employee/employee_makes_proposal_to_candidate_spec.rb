require 'rails_helper'

feature 'Employee makes proposal to candidate' do
  let!(:company) { create(:company) }
  let(:employee) { create(:employee, company: company) }
  let(:job_opportunity) { create(:job_opportunity, job_title: 'Desenvolvedor', company: company) }
  let(:candidate) { create(:candidate, firstname: 'Juliana') }

  before do
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
  end

  scenario 'successfully' do
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Desenvolvedor'
    click_on 'Fazer proposta para Juliana'
    fill_in 'Mensagem', with: 'Mensagem teste'
    fill_in 'Proposta salarial', with: '2500'
    fill_in 'Data de início', with: '25/04/2021'
    click_on 'Enviar'

    expect(JobProposal.count).to eq(1)
    expect(page).to have_content 'A proposta foi enviada para o candidato'
  end
end
