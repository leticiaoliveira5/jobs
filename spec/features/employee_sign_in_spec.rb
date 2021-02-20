require 'rails_helper'

feature 'Employee sign in' do

  scenario 'successfully' do
    visit root_path
    click_on 'Área da empresa'
    click_on 'Cadastre-se'
    fill_in 'Nome', with 'Steve'
    fill_in 'Sobrenome', with 'Jobs'
    fill_in 'Email', with 'steve@apple.com'
    fill_in 'Senha', with '123456'
    click_on 'Sign up'

    expect(page).to have_content('Jobs')
    expect(page).to have_content('Welcome! You have signed up successfully.')
    
  end

end
