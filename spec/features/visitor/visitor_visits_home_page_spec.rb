require 'rails_helper'

feature 'Visitor visits home page' do
  before do
    apple = create(:company, name: 'Apple', domain: 'apple.com')
    create(:company, name: 'Microsoft', domain: 'microsoft.com', cnpj: '12345678911235')
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor',
                             job_level: 'Pleno', place: 'Home Office',
                             status: :active)
  end

  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs')
    expect(page).to have_button('Entrar') && have_button('Cadastre-se')
    within('.nav') do
      expect(page).to have_link('Ver empresas cadastradas')
      expect(page).to have_link('Vagas recentes')
    end
  end

  scenario 'and views registered companies' do
    visit root_path
    click_on 'Ver empresas cadastradas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')
  end

  scenario 'and views recent job opportunities' do
    visit root_path
    click_on 'Vagas recentes'

    expect(page).to have_link('Desenvolvedor')
    expect(page).to have_text('Pleno') && have_text('Home Office')
  end
end
