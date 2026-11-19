require 'rails_helper'

RSpec.describe TabsComponent, type: :component do
  let(:tabs) do
    [
      { id: 'candidate-form', title: 'Candidate', content: '<p>Candidate form</p>'.html_safe },
      { id: 'employee-form', title: 'Company', content: '<p>Company form</p>'.html_safe }
    ]
  end

  describe 'tabs rendering' do
    before { render_inline(described_class.new(tabs: tabs)) }

    it 'renders one tab for each item' do
      expect(page).to have_css('.tabs .tab', count: 2)
    end

    it 'displays the title of each tab' do
      expect(page).to have_css('.tab', text: 'Candidate')
      expect(page).to have_css('.tab', text: 'Company')
    end

    it 'calls showTab with the matching id on click' do
      expect(page).to have_css(".tab[onclick=\"showTab(event, 'candidate-form')\"]")
      expect(page).to have_css(".tab[onclick=\"showTab(event, 'employee-form')\"]")
    end

    it 'splits the space equally between tabs' do
      expect(page).to have_css('.tabs.d-flex .tab.flex-fill', count: 2)
    end
  end

  describe 'tab content' do
    before { render_inline(described_class.new(tabs: tabs)) }

    it 'renders one panel for each tab with the correct id' do
      expect(page).to have_css('.tabcontent', count: 2, visible: :all)
      expect(page).to have_css('#candidate-form.tabcontent', visible: :all)
      expect(page).to have_css('#employee-form.tabcontent', visible: :all)
    end

    it 'renders the content inside each panel' do
      expect(page).to have_css('#candidate-form', text: 'Candidate form', visible: :all)
      expect(page).to have_css('#employee-form', text: 'Company form', visible: :all)
    end
  end

  describe 'tab switching script' do
    before { render_inline(described_class.new(tabs: tabs)) }

    it 'includes the showTab function' do
      expect(page).to have_css('script', text: 'function showTab', visible: :all)
    end

    it 'opens the first tab by default' do
      expect(page).to have_css('script', text: 'getElementById("defaultOpen").click()',
                                         visible: :all)
      expect(page).to have_css('#defaultOpen', text: 'Candidate')
    end
  end

  describe 'without tabs' do
    it 'renders neither tabs nor panels' do
      render_inline(described_class.new(tabs: []))

      expect(page).not_to have_css('.tab')
      expect(page).not_to have_css('.tabcontent', visible: :all)
    end
  end
end
