# frozen_string_literal: true

require 'rails_helper'

feature 'Employee makes proposal to candidate' do
  scenario 'successfully' do
    # arrange
    company = create(:company)
    employee = create(:employee, company: company)
    candidate = create(:candidate, firstname: 'Juliana')
    job_opportunity = create(:job_opportunity, job_title: 'Desenvolvedor', company: company)
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
    # act
    login_as employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Desenvolvedor'
    click_on 'Fazer proposta para Juliana'
    fill_in 'Mensagem', with: 'Mensagem teste'
    fill_in 'Proposta salarial', with: '2500'
    fill_in 'Data de início', with: '25/04/2021'
    click_on 'Enviar'
    # assert
    expect(JobProposal.count).to eq(1)
    expect(page).to have_content 'A proposta foi enviada para o candidato'
  end
end
