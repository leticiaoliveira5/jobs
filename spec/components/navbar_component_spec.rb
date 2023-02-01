require 'rails_helper'

RSpec.describe NavbarComponent, type: :component do
  let(:rendered_component) do
    render_inline(described_class.new(title: 'Jobs')).to_html
  end

  it 'renders nav bar' do
    expect(rendered_component).to have_content('Jobs')
  end
end
