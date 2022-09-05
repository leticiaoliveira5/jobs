# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GridComponent, type: :component do
  let(:rendered_component) { render_inline(described_class.new(params)).to_html }
  let(:params) { { columns: 2, rows: 2 } }

  it 'renders the component' do
    expect(rendered_component).to have_css('.grid')
  end
end
