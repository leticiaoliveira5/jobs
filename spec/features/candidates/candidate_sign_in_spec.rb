require 'rails_helper'

feature 'Candidate sign in' do
  before do
    create(:candidate, firstname: 'Maria', email: 'mariap@email.com', password: '123456')
  end

  scenario 'successfully' do
    visit root_path
    within('#candidate-form') do
      fill_in 'E-mail', with: 'mariap@email.com'
      fill_in 'Senha', with: '123456'
      click_on 'Login'
    end

    expect(current_path).to eq('/candidate/dashboard')
  end

  scenario 'with invalid password' do
    visit root_path
    within('#candidate-form') do
      fill_in 'E-mail', with: 'mariap@email.com'
      fill_in 'Senha', with: 'wrongpassword'
      click_on 'Login'
    end

    # TODO: do not redirect user to sign in page, show error message instead
    expect(current_path).to eq('/candidates/sign_in')
    expect(page).to have_content 'E-mail ou senha inválidos.'
  end
end
