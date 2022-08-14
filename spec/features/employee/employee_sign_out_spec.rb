require 'rails_helper'

feature 'Candidate sign out' do
  let(:employee) { create(:employee) }

  scenario 'successfully' do
    login_as employee, scope: :employee
    visit company_path(employee.company)
    within('.nav') { click_on('Sair') }

    expect(current_path).to eq root_path
  end
end
