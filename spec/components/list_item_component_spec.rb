require 'rails_helper'

RSpec.describe ListItemComponent, type: :component do
  let(:rendered_component) { render_inline(described_class.new).to_html }

  it 'renders the login component' do
    expect(rendered_component).to have_css('div')
  end
end
