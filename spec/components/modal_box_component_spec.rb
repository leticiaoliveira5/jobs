require 'rails_helper'

RSpec.describe ModalBoxComponent, type: :component do
  let(:rendered_component) do
    render_inline(described_class.new(title: 'Title Test', modal_id: 'test_id')).to_html
  end

  context 'renders modal box' do
    it do
      expect(rendered_component).to have_css('#test_id')
      expect(rendered_component).to have_css('.backdrop')
      expect(rendered_component).to have_css('.modalbox')
      expect(rendered_component).to have_css('.title', text: 'Title Test')
    end
  end
end
