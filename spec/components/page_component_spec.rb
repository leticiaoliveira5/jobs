# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageComponent, type: :component do
  subject(:component) { described_class.new }

  let(:rendered_component) do
    render_inline(component) do |page|
      page.with_sidebar { 'Sidebar' } if with_sidebar
      page.with_main_content { 'Content' }
    end.to_html
  end

  context 'with sidebar' do
    let(:with_sidebar) { true }

    it 'renders the sidebar and the content in a grid row' do
      expect(rendered_component).to have_css('.max-w-\[1140px\] .grid.grid-cols-12')
      expect(rendered_component).to have_css(
        '.grid > [class~="md:col-span-4"][class~="lg:col-span-3"]', text: 'Sidebar'
      )
      expect(rendered_component).to have_css(
        '.grid > [class~="md:col-span-8"][class~="lg:col-span-9"]', text: 'Content'
      )
    end
  end

  context 'without sidebar' do
    let(:with_sidebar) { false }

    it 'renders only the content, using the full width' do
      expect(rendered_component).to have_css('.grid > .col-span-12', text: 'Content')
      expect(rendered_component).to have_no_css('[class~="md:col-span-4"]')
      expect(rendered_component).to have_no_css('[class~="md:col-span-8"]')
      expect(rendered_component).to have_no_text('Sidebar')
    end
  end
end
