require "rails_helper"

RSpec.describe LoginFormComponent, type: :component do
  it 'renders the candidate form' do
    rendered_component =
      render_inline(described_class.new(resource_name: 'candidate')).to_html

    expect(rendered_component).to have_css('label', text: 'Senha', count: 1)
    expect(rendered_component).to have_css('label', exact_text: 'E-mail', count: 1)
    expect(rendered_component).to have_button('Login')
  end

  it 'renders the employee form' do
    rendered_component =
      render_inline(described_class.new(resource_name: 'employee')).to_html

    expect(rendered_component).to have_css('label', text: 'Senha', count: 1)
    expect(rendered_component).to have_css('label', exact_text: 'E-mail corporativo', count: 1)
    expect(rendered_component).to have_button('Login')
  end
end
