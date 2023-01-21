# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxComponent, type: :component do
  subject { described_class.new }

  let(:rendered_component) do
    render_inline(subject) do |component|
      component.title { 'Title' }
      component.body { 'Body' }
    end.to_html
  end

  it 'renders the component' do
    expect(rendered_component).to have_css('.title', text: 'Title')
    expect(rendered_component).to have_css('.content', text: 'Body')
  end

  context 'attribute color is not set' do
    it { expect(rendered_component).to include('background-color:var(--content_blocks_color)') }
  end

  context 'color attribute is set to primary' do
    subject { described_class.new(color: :primary) }

    it { expect(rendered_component).to include('background-color:var(--content_blocks_color)') }
  end

  context 'color attribute is set to secondary' do
    subject { described_class.new(color: :secondary) }

    it { expect(rendered_component).to include('background-color:var(--nav_background_color)') }
  end
end
