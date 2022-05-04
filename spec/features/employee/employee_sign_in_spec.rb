require 'rails_helper'

feature 'Employee sign in' do
  scenario 'and company already exists' do
    apple = create(:company, name: 'Apple', domain: 'apple.com', address: 'Los Angeles')

    fill_in 'Nome', with: 'Ronald'
    fill_in 'Sobrenome', with: 'Wayne'
    fill_in 'E-mail', with: 'ronald@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Apple')
    expect(Employee.last.company).to eq apple
  end
end
