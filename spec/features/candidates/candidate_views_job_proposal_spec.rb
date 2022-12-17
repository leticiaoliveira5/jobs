require 'rails_helper'

feature 'Candidate views job proposals' do
  let!(:company) { create(:company, name: 'Globe') }
  let!(:candidate) { create(:candidate) }
  let!(:job_opportunity) { create(:job_opportunity, company: company, job_title: 'Desenvolvedor') }
  let(:job_application) do
    create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
  end

  before do
    create(:job_proposal, job_application: job_application,
                          candidate: candidate,
                          job_opportunity: job_opportunity)
  end

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Área do candidato'

    expect(page).to have_content 'Propostas recebidas'
    expect(page).to have_text 'Vaga: Desenvolvedor'
    expect(page).to have_link 'Ver detalhes da proposta'
  end

  feature 'Candidate responds to job proposal' do
    before do
      login_as candidate, scope: :candidate
      visit root_path
      click_on 'Área do candidato'
      click_on 'Ver detalhes da proposta'
    end

    scenario 'accepts it' do
      within('.accept-form') do
        fill_in 'start_date_confirmation', with: '01/01/2022'
        click_on 'Confirmar'
      end

      expect(page).to have_content 'Confirmação enviada com sucesso!'
      expect(JobProposal.first.status).to eq('accepted')
    end

    scenario 'rejects it' do
      within('.reject-form') do
        fill_in 'rejection_motive', with: 'motivo teste'
        click_on 'Confirmar'
      end

      expect(page).to have_content 'Resposta enviada com sucesso'
      expect(JobProposal.first.status).to eq('rejected')
    end
  end
end
