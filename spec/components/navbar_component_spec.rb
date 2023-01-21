require 'rails_helper'

RSpec.describe NavbarComponent, type: :component do
  it 'renders nav bar' do
    rendered_component = render_inline(described_class.new(current_user: nil)).to_html

    expect(rendered_component).to have_content('Jobs')
    expect(rendered_component).to have_link('Empresas', href: '/companies')
    expect(rendered_component).to have_link('Vagas', href: '/jobs')
  end
end
