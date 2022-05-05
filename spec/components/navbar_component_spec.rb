require 'rails_helper'

RSpec.describe NavbarComponent, type: :component do
  it 'renders nav bar' do
    rendered_component = render_inline(described_class.new(current_user: nil)).to_html

    expect(rendered_component).to have_content('Jobs')
    expect(rendered_component).to have_link('Ver empresas cadastradas', href: '/companies')
    expect(rendered_component).to have_link('Vagas recentes', href: '/job_opportunities')
  end
end
