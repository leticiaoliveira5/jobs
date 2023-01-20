require 'rails_helper'

feature 'Visitor views job opportunities' do
  let(:apple) { create(:company, name: 'Apple') }
  let!(:active_job_opportunity) do
    create(:job_opportunity, company: apple,
                             job_title: 'Desenvolvedor',
                             job_level: 'Pleno',
                             place: 'Home Office',
                             status: :active)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Vagas'
    within(".list-item##{active_job_opportunity.id}") do
      click_on 'Ver detalhes'
    end

    expect(page).to have_text('Desenvolvedor') &&
                    have_text('Apple') &&
                    have_text('Pleno') &&
                    have_text('Home Office')
  end

  scenario 'and clicks to apply' do
    visit root_path
    click_on 'Vagas'
    within(".list-item##{active_job_opportunity.id}") do
      click_on 'Ver detalhes'
    end
    click_on 'Faça login para inscrever-se nesta vaga'

    expect(current_path).to eq(new_candidate_session_path)
    expect(page).to have_text('Para continuar, faça login ou registre-se.')
  end

  scenario 'only if job opportunity is active' do
    create(:job_opportunity, company: apple, job_title: 'Tech Lead', status: :inactive)

    visit root_path
    click_on 'Vagas'

    expect(current_path).to eq(job_opportunities_path)
    expect(page).not_to have_content('Tech Lead')
  end
end
