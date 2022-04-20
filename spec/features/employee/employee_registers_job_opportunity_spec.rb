require 'rails_helper'

feature 'employee registers job opportunity' do
  let!(:employee) { create(:employee) }
  let(:company) { employee.company }

  before do
    login_as employee, scope: :employee
    visit root_path
    click_on 'Área da empresa'
    click_on 'Cadastrar nova vaga'
  end

  scenario 'successfully' do
    fill_in_all_fields
    click_on 'Cadastrar vaga'

    expect(employee.company.job_opportunities.count).to eq(1)
    expect(employee.company.job_opportunities.first.job_title).to eq('Ator')
    expect(page).to have_text('Ator') && have_text('Descrição') &&
                    have_text('Atuar em novelas da emissora')
  end

  scenario 'only if all fields are filled' do
    fill_in 'Título da vaga', with: 'Atriz'
    click_on 'Cadastrar vaga'

    expect(JobOpportunity.count).to eq(0)
    expect(page).to have_text('Descrição não pode ficar em branco') &&
                    have_text('Nível não pode ficar em branco') &&
                    have_text('Faixa salarial não pode ficar em branco') &&
                    have_text('Local não pode ficar em branco') &&
                    have_text('Data limite não pode ficar em branco')
  end

  private

  def fill_in_all_fields
    fill_in 'Título da vaga', with: 'Ator'
    fill_in 'Faixa salarial', with: 'A combinar'
    within('.select_level') { select 'Pleno' }
    fill_in 'Local', with: 'Curicica, Rio de Janeiro'
    fill_in 'Descrição', with: 'Atuar em novelas da emissora'
    fill_in 'Data limite', with: 2.months.from_now
    fill_in 'Número de vagas', with: '2'
  end
end
