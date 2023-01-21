require 'rails_helper'

feature 'Visitor visits home page' do
  before do
    apple = create(:company, name: 'Apple', domain: 'apple.com')
    create(:company, name: 'Microsoft', domain: 'microsoft.com', document: '12345678911235')
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor',
                             job_level: 'Pleno', place: 'Home Office',
                             status: :active)
  end

  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs')
    expect(page).to have_button('Login') && have_link('Inscrever-se')
    within('.nav') do
      expect(page).to have_link('Empresas')
      expect(page).to have_link('Vagas')
    end
  end
end
