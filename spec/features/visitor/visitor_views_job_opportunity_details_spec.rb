require 'rails_helper'

feature 'Visitor views job opportunity details' do
  let(:apple) { create(:company, name: 'Apple') }
  let(:create_active_job_opportunity) do
    create(:job_opportunity, company: apple,
                             job_title: 'Desenvolvedor',
                             job_level: 'Pleno',
                             place: 'Home Office',
                             status: :active)
  end
  let(:create_inactive_job_opportunity) do
    create(:job_opportunity, company: apple,
                             job_title: 'Desenvolvedor',
                             status: :inactive)
  end

  scenario 'successfully' do
    create_active_job_opportunity
    visit root_path
    click_on 'Desenvolvedor'

    expect(page).to have_text('Desenvolvedor') &&
                    have_text('Apple') &&
                    have_text('Pleno') &&
                    have_text('Home Office')
  end

  scenario 'and clicks to apply' do
    create_active_job_opportunity
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    click_on 'Desenvolvedor'
    click_on 'Inscrever-se nesta vaga'

    expect(current_path).to eq(new_candidate_session_path)
    expect(page).to have_text('Para continuar, faça login ou registre-se.')
  end

  scenario 'only if job opportunity is active' do
    create_inactive_job_opportunity
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'

    expect(current_path).to eq(company_path(apple))
    expect(page).not_to have_content('Desenvolvedor')
  end
end
