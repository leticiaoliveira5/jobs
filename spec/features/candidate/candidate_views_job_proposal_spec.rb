require 'rails_helper'

feature 'Candidate views job proposals' do
  let!(:company) { create(:company, name: 'Globe') }
  let!(:candidate) { create(:candidate) }
  let!(:job_opportunity) do
    create(:job_opportunity, company: company, job_title: 'Desenvolvedor')
  end
  let!(:job_application) do
    create(:job_application, candidate: candidate,
                             job_opportunity: job_opportunity,
                             status: 0)
  end
  before do
    create(:job_proposal, job_application: job_application,
                          candidate: candidate,
                          job_opportunity: job_opportunity)
  end

  scenario 'and accepts it' do
    candidate_is_logged_in_on_candidate_dashboard
    views_received_proposals
    clicks_on_opportunity_link
    accepts_job_proposal
    views_success_message('Confirmação enviada com sucesso!')
    job_proposal_status_is_changed_to('accepted')
  end

  scenario 'and rejects it' do
    candidate_is_logged_in_on_candidate_dashboard
    views_received_proposals
    clicks_on_opportunity_link
    rejects_job_proposal
    views_success_message('Resposta enviada com sucesso')
    job_proposal_status_is_changed_to('rejected')
  end

  private

  def candidate_is_logged_in_on_candidate_dashboard
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Área do candidato'
  end

  def clicks_on_opportunity_link
    click_on "#{job_opportunity.job_title} - #{company.name}"
  end

  def accepts_job_proposal
    within('.accept-form') do
      fill_in 'start_date_confirmation', with: '01/01/2022'
      click_on 'Confirmar'
    end
  end

  def rejects_job_proposal
    within('.reject-form') do
      fill_in 'rejection_motive', with: 'motivo teste'
      click_on 'Confirmar'
    end
  end

  def views_received_proposals
    expect(page).to have_content 'Propostas recebidas'
    expect(page).to have_link 'Desenvolvedor - Globe'
  end

  def job_proposal_status_is_changed_to(status)
    expect(job_proposal.reload.status).to eq(status)
  end

  def views_success_message(message)
    expect(page).to have_content message
  end
end
