# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxComponent, type: :component do
  let(:rendered_component) do
    render_inline(described_class.new()) do |component|
      component.title { 'Title' }
      component.body { 'Body' }
    end.to_html
  end

  it 'renders the component' do
    expect(rendered_component).to have_css('.title', text: 'Title')
    expect(rendered_component).to have_css('.content', text: 'Body')
  end
end
