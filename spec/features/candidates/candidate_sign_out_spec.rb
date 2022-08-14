require 'rails_helper'

feature 'Candidate sign out' do
  let(:employee) { create(:employee) }

  before { login_as employee, scope: :employee }

  scenario 'successfully' do
    visit root_path
    click_on 'Sair'

    expect(current_path).to eq root_path
  end
end
