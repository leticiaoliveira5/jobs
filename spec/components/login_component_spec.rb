require 'rails_helper'

RSpec.describe LoginComponent, type: :component do
  let(:rendered_component) { render_inline(described_class.new).to_html }

  it 'renders the login component' do
    expect(rendered_component).to have_css('.tabs')
    expect(rendered_component).to have_css('.tabcontent')
    expect(rendered_component).to have_css('.tab', text: 'Candidato')
    expect(rendered_component).to have_css('.tab', text: 'Empresa')
  end
end
