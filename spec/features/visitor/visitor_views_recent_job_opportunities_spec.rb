require 'rails_helper'

feature 'Visitor viws recent job opportunities' do
  before do
    apple = create(:company, name: 'Apple', domain: 'apple.com')
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor',
                             job_level: 'Pleno', place: 'Home Office',
                             status: :active)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Vagas'

    expect(page).to have_link('Ver detalhes')
    expect(page).to have_text('Pleno') && have_text('Home Office')
  end
end
