# frozen_string_literal: true

require 'rails_helper'

feature 'Employee searches candidates' do
  let(:employee) { create(:employee) }
  let(:company) { employee.company }
  let!(:candidate) { create(:candidate, firstname: 'José', surname: 'Costa') }

  before do
    login_as employee, scope: :employee
    visit root_path
    within('.nav') { click_on 'Candidatos' }
  end

  scenario 'by name' do
    fill_in :search, with: 'José'
    expect_to_find_candidate
  end

  scenario 'by address' do
    fill_in :search, with: candidate.address.city
    expect_to_find_candidate
  end

  def expect_to_find_candidate
    page.find('button[type="submit"]').click
    expect(current_path).to eq(candidates_path)
    expect(page).to have_content('Resultado da Busca:') && have_link('José Costa')
  end
end
