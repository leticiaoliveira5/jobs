require 'rails_helper'

feature 'Visitor searches job opportunities' do
  let(:apple) { create(:company, name: 'Apple') }

  before do
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
    create(:job_opportunity, company: apple, job_title: 'Supervisor')
    visit root_path
    click_on 'Vagas'
  end

  scenario 'by job title' do
    fill_in :search_input, with: 'desenvolvedor'
    page.find('button[type="submit"]').click

    expect(current_path).to eq(job_opportunities_path)
    expect(page).to have_text 'Desenvolvedor'
    expect(page).to have_text 'Apple'
  end

  scenario 'by company name' do
    fill_in :search_input, with: 'Apple'
    page.find('button[type="submit"]').click

    expect(current_path).to eq(job_opportunities_path)
    expect(page).to have_text 'Desenvolvedor'
    expect(page).to have_text 'Supervisor'
    expect(page).to have_text 'Apple'
  end
end
