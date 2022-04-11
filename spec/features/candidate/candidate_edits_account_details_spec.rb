require 'rails_helper'

feature 'candidate edits account details' do
  let(:candidate) { create(:candidate) }

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Área do candidato'
    click_on 'Editar dados da minha conta'
    fill_in 'About me', with: 'Olá, meu nome é Maria'
    fill_in 'Current password', with: '123456'
    click_on 'Update'

    expect(Candidate.first.reload.about_me).to eq('Olá, meu nome é Maria')
  end
end
