require 'rails_helper'

RSpec.describe GridComponent, type: :component do
  let(:rendered_component) { render_inline(subject).to_html }

  context 'builds css with attributes' do
    subject { described_class.new(columns: 2, rows: 3, column_gap: 2, row_gap: 2) }

    it { expect(rendered_component).to match('grid-template-columns: 1fr 1fr ') }
    it { expect(rendered_component).to match('grid-template-rows: auto auto auto') }
    it { expect(rendered_component).to match('row-gap: 2px') }
    it { expect(rendered_component).to match('column-gap: 2px') }
  end

  context 'builds css with nil attributes' do
    subject { described_class.new }

    it { expect(rendered_component).to match('grid-template-columns: auto') }
    it { expect(rendered_component).to match('grid-template-rows: auto') }
    it { expect(rendered_component).to match('row-gap: 1rem') }
    it { expect(rendered_component).to match('column-gap: 1rem') }
  end

  context 'is responsive' do
    subject { described_class.new(type: :responsive) }

    it { expect(rendered_component).to have_css('.responsive-grid') }
  end

  context 'is fixed' do
    subject { described_class.new(type: :fixed) }

    it { expect(rendered_component).to have_css('.grid') }
  end
end
