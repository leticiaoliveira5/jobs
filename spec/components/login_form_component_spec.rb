require 'rails_helper'

RSpec.describe LoginFormComponent, type: :component do
  let(:rendered_component) do
    render_inline(described_class.new(resource_name: resource_name)).to_html
  end

  context 'renders candidate form' do
    let(:resource_name) { 'candidate' }

    it do
      expect(rendered_component).to have_css('label', text: 'Senha', count: 1)
      expect(rendered_component).to have_css('label', exact_text: 'E-mail', count: 1)
      expect(rendered_component).to have_button('Login')
    end
  end

  context 'renders employee form' do
    let(:resource_name) { 'employee' }

    it do
      expect(rendered_component).to have_css('label', exact_text: 'E-mail corporativo', count: 1)
    end
  end
end
