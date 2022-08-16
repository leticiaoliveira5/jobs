require 'rails_helper'

feature 'Candidate logs in' do
  let(:candidate) { create(:candidate) }

  before { visit root_path}

  scenario 'successfully' do
    within('#candidate-form') do
      fill_in 'E-mail', with: candidate.email
      fill_in 'Senha', with: candidate.password
      click_on 'Login'
    end

    expect(current_path).to eq candidates_path(candidate)
  end

  scenario 'unsuccessfully' do
    within('#candidate-form') do
      fill_in 'E-mail', with: candidate.email
      fill_in 'Senha', with: 'wrong_password'
      click_on 'Login'
    end

    expect(current_path).to eq new_candidate_session_path
  end
end
