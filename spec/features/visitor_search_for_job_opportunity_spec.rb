# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor searches job opportunities' do
  scenario 'successfully' do
    # arrange
    apple = create(:company, name: 'Apple')
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
    # act
    visit root_path
    fill_in 'Busca por empresa ou vaga', with: 'desenvolvedor'
    click_on 'Buscar'
    # assert
    expect(current_path).to eq(search_results_path)
    expect(page).to have_link 'Desenvolvedor'
    expect(page).to have_link 'Apple'
  end

  scenario 'by company name' do
    # arrange
    apple = create(:company, name: 'Apple')
    create(:job_opportunity, company: apple, job_title: 'Desenvolvedor')
    create(:job_opportunity, company: apple, job_title: 'Supervisor')
    # act
    visit root_path
    fill_in 'Busca por empresa ou vaga', with: 'Apple'
    click_on 'Buscar'
    # assert
    expect(current_path).to eq(search_results_path)
    expect(page).to have_link 'Desenvolvedor'
    expect(page).to have_link 'Supervisor'
    expect(page).to have_link 'Apple'
  end
end
