require 'rails_helper'

feature 'Visitor viws recent job opportunities' do
  let(:apple) { create(:company, name: 'Apple', domain: 'apple.com') }

  before do
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

  scenario 'only if job opportunity is active' do
    create(:job_opportunity, company: apple, job_title: 'Tech Lead', status: :inactive)

    visit root_path
    click_on 'Vagas'

    expect(current_path).to eq(job_opportunities_path)
    expect(page).not_to have_content('Tech Lead')
  end
end
