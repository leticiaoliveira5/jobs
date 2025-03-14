require 'rails_helper'

feature 'candidate edits account details' do
  let(:candidate) do
    Candidate.create(firstname: 'Maria',
                     email: 'example@example.net',
                     password: '123456')
  end

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    within('.nav') { click_on 'Área do candidato' }
    click_on 'Editar meus dados'
    fill_in 'About me', with: 'Olá, meu nome é Maria'
    fill_in 'Current password', with: '123456'
    click_on 'Update'

    expect(Candidate.first.about_me).to eq('Olá, meu nome é Maria')
  end
end
