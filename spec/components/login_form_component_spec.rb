require 'rails_helper'

RSpec.describe LoginFormComponent, type: :component do

  def rendered_component(resource_name)
    render_inline(described_class.new(resource_name: resource_name)).to_html
  end

  it 'renders the candidate form' do
    view = rendered_component('candidate')

    expect(view).to have_css('label', text: 'Senha', count: 1)
    expect(view).to have_css('label', exact_text: 'E-mail', count: 1)
    expect(view).to have_button('Login')
  end

  it 'renders the employee form' do
    view = rendered_component('employee')

    expect(view).to have_css('label', text: 'Senha', count: 1)
    expect(view).to have_css('label', exact_text: 'E-mail corporativo', count: 1)
    expect(view).to have_button('Login')
  end
end
