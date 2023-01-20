require 'rails_helper'

RSpec.describe GridComponent, type: :component do
  subject { described_class.new(columns: 2, rows: 2) }

  let(:rendered_component) { render_inline(subject).to_html }

  context 'is responsive' do
    subject { described_class.new(type: :responsive) }

    it 'renders the component' do
      expect(rendered_component).to have_css('.responsive-grid')
    end
  end

  context 'is fixed' do
    subject { described_class.new(type: :fixed) }

    it 'renders the component' do
      expect(rendered_component).to have_css('.grid')
    end
  end
end
