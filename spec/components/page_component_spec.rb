require 'rails_helper'

RSpec.describe PageComponent, type: :component do
  let(:rendered_component) do
    render_inline(described_class.new) do |component|
      component.sidebar { 'Sidebar' }
      component.main_content { 'Content' }
    end.to_html
  end

  context 'renders page' do
    it do
      expect(rendered_component).to have_css('div.page')
      expect(rendered_component).to have_css('div.page-content', text: 'Content')
      expect(rendered_component).to have_css('div.page-sidebar', text: 'Sidebar')
    end
  end
end
