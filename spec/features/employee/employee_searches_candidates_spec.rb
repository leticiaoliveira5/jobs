require 'rails_helper'

feature 'Employee searches candidates' do
  let!(:employee) { create(:employee) }
  let!(:company) { employee.company }
  
  before do
    @candidate = create(:candidate, address: 'Rio de Janeiro')
    login_as employee, scope: :employee
    visit root_path
    within('.nav') { click_on 'Candidatos' }
  end

  scenario 'by name' do
    fill_in :search, with: @candidate.firstname
    expect_to_find_candidate
  end

  scenario 'by address' do
    fill_in :search, with: 'Rio de Janeiro'
    expect_to_find_candidate
  end

  def expect_to_find_candidate
    page.find('button[type="submit"]').click
    expect(current_path).to eq(candidates_path)
    expect(page).to have_content('Resultado da Busca:') && have_link(@candidate.full_name)
  end
end
