# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxComponent, type: :component do
  subject { described_class.new }

  let(:rendered_component) do
    render_inline(subject) do |component|
      component.with_title { 'Title' }
      component.with_body { 'Body' }
    end.to_html
  end

  it 'renders the title and the body' do
    expect(rendered_component).to have_css('.fs-4.fw-bold', text: 'Title')
    expect(rendered_component).to have_text('Body')
  end

  context 'when behavior is default' do
    it 'does not render toggle markup nor script' do
      expect(rendered_component).to have_no_css('[aria-controls]')
      expect(rendered_component).to have_no_css('.d-none')
      expect(rendered_component).not_to include('<script>')
    end
  end

  context 'when collapsible and open by default' do
    subject { described_class.new(behavior: :collapsible, default: :open) }

    it 'renders the toggle expanded with the content visible' do
      expect(rendered_component).to have_css('[aria-controls][aria-expanded="true"]', text: 'Title')
      expect(rendered_component).to have_css('[aria-hidden="true"]', text: '−')
      expect(rendered_component).to have_text('Body')
      expect(rendered_component).to have_no_css('.d-none')
    end

    it 'renders the toggle script' do
      expect(rendered_component).to include('<script>')
    end

    it 'links the toggle to the content through a matching id' do
      target = Nokogiri::HTML.fragment(rendered_component).at_css('[aria-controls]')['aria-controls']

      expect(rendered_component).to have_css("##{target}", text: 'Body')
    end
  end

  context 'when collapsible and closed by default' do
    subject { described_class.new(behavior: :collapsible, default: :closed) }

    it 'renders the toggle collapsed with the content hidden' do
      expect(rendered_component).to have_css('[aria-controls][aria-expanded="false"]', text: 'Title')
      expect(rendered_component).to have_css('[aria-hidden="true"]', text: '+')
      expect(rendered_component).to have_css('.d-none', text: 'Body')
    end
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

  context 'color attribute is set to transparent' do
    subject { described_class.new(color: :transparent) }

    it { expect(rendered_component).to include('background-color:transparent') }
  end
end