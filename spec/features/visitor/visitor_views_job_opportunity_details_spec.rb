require 'rails_helper'

feature 'Visitor views job opportunity details' do
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
    within("#job-#{active_job_opportunity.id}") do
      click_on 'Ver detalhes'
    end

    expect(page).to have_text('Desenvolvedor') &&
                    have_text('Apple') &&
                    have_text('Pleno') &&
                    have_text('Home Office')
  end
end
