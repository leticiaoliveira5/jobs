require 'rails_helper'

feature 'Visitor searches job opportunities' do
  let(:apple) { create(:company, name: 'Apple') }

  before do
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
    create(:job_opportunity, company: apple, job_title: 'Supervisor')
  end

  scenario 'successfully' do
    visit root_path
    fill_in 'Busca por empresa ou vaga', with: 'Desenvolvedor'
    click_on 'Buscar'

    expect(current_path).to eq(search_results_path)
    expect(page).to have_link 'Desenvolvedor'
    expect(page).to have_link 'Apple'
  end

  scenario 'by company name' do
    visit root_path
    fill_in 'Busca por empresa ou vaga', with: 'Apple'
    click_on 'Buscar'

    expect(current_path).to eq(search_results_path)
    expect(page).to have_link 'Desenvolvedor'
    expect(page).to have_link 'Supervisor'
    expect(page).to have_link 'Apple'
  end
end
