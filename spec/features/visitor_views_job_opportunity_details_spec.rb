require 'rails_helper'

feature 'Visitor views job opportunity details' do
  scenario 'successfully' do
    # arrange
    apple = create(:company, name: 'Apple')
    create(:job_opportunity, company: apple,
                             job_title: 'Desenvolvedor',
                             job_level: 'Pleno',
                             salary_range: 'Inbox',
                             place: 'Home Office')
    # act
    visit root_path
    click_on 'Desenvolvedor'
    # assert
    expect(page).to have_content('Desenvolvedor')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Pleno')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Home Office')
  end

  scenario 'and clicks to apply' do
    # arrange
    apple = create(:company, name: 'Apple')
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
    # act
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    click_on 'Desenvolvedor'
    click_on 'Inscrever-se nesta vaga'
    # assert
    expect(current_path).to eq(new_candidate_session_path)
    expect(page).to have_text('Para continuar, faça login ou registre-se.')
  end

  scenario 'only if job opportunity is active' do
    # arrange
    apple = create(:company, name: 'Apple')
    job_opportunity = create(:job_opportunity, company: apple,
                                               job_title: 'Desenvolvedor',
                                               job_level: 'Pleno',
                                               salary_range: 'Inbox',
                                               place: 'Home Office')
    job_opportunity.inactive!
    # act
    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    # assert
    expect(current_path).to eq(company_path(apple))
    expect(page).not_to have_content('Desenvolvedor')
  end
end
