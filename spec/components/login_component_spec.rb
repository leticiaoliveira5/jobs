require 'rails_helper'

RSpec.describe LoginComponent, type: :component do
  let(:rendered_component) { render_inline(described_class.new).to_html }
  it 'renders the login component' do
    expect(rendered_component).to have_css('.tabs')
    expect(rendered_component).to have_css('.tabcontent')
    expect(rendered_component).to have_css('.tab', text: 'Candidato')
    expect(rendered_component).to have_css('.tab', text: 'Empresa')
    expect(rendered_component).to have_link('Login')
  end

  it 'had the input fields and labels' do
    expect(rendered_component).to have_css('input', count: 4)
    expect(rendered_component).to have_css('label', text: 'Senha', count: 2)
    expect(rendered_component).to have_css('label', exact_text: 'E-mail', count: 1)
    expect(rendered_component).to have_css('label', exact_text: 'E-mail corporativo', count: 1)
  end
end
