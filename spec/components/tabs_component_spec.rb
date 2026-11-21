require 'rails_helper'

RSpec.describe TabsComponent, type: :component do
  context 'with tabs' do
    before do
      render_inline(described_class.new) do |component|
        component.with_tab(id: 'first', title: 'First') { 'First content' }
        component.with_tab(id: 'second', title: 'Second') { 'Second content' }
      end
    end

    it 'renders one tab for each item' do
      expect(page).to have_css('.tab', count: 2)
    end

    it 'displays the title of each tab' do
      expect(page).to have_css('.tab', text: 'First')
      expect(page).to have_css('.tab', text: 'Second')
    end

    it 'calls showTab with the matching id on click' do
      expect(page).to have_css(".tab[onclick*=\"showTab(event, 'first')\"]")
    end

    it 'splits the space equally between tabs' do
      expect(page).to have_css('.tab.flex-1', count: 2)
    end

    it 'renders the content inside each panel' do
      expect(page).to have_css('#first.tabcontent', text: 'First content')
      expect(page).to have_css('#second.tabcontent', text: 'Second content')
    end
  end

  context 'without tabs' do
    before { render_inline(described_class.new) }

    it 'renders neither tabs nor panels' do
      expect(page).to have_no_css('.tab')
      expect(page).to have_no_css('.tabcontent')
    end
  end
end
