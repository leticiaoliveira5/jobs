require 'rails_helper'

feature 'Visitor tries to apply' do
  let(:apple) { create(:company, name: 'Apple') }
  let!(:active_job_opportunity) do
    create(:job_opportunity, company: apple,
                             job_title: 'Desenvolvedor',
                             job_level: 'Pleno',
                             place: 'Home Office',
                             status: :active)
  end

  scenario 'and is redirected to new session path' do
    visit root_path
    click_on 'Vagas'
    within("#job-#{active_job_opportunity.id}") do
      click_on 'Ver detalhes'
    end
    click_on 'Faça login para inscrever-se nesta vaga'

    expect(current_path).to eq(new_candidate_session_path)
    expect(page).to have_text('Para continuar, faça login ou registre-se.')
  end
end
