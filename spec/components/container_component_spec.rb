require 'rails_helper'

RSpec.describe ContainerComponent, type: :component do
  let(:rendered_component) { render_inline(described_class.new).to_html }

  it 'renders the component' do
    expect(rendered_component).to have_css('.container')
  end
end
