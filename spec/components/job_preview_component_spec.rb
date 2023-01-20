# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobPreviewComponent, type: :component do
  let(:job_opportunity) { create(:job_opportunity) }
  let(:rendered_component) do
    render_inline(described_class.new(job_opportunity: job_opportunity)).to_html
  end
  let(:path) { "/jobs/#{job_opportunity.id}" }

  it 'renders the component' do
    expect(rendered_component).to have_css('.list-item')
    expect(rendered_component).to have_link('Ver detalhes', href: path)
    expect(rendered_component).to have_css('h4', text: job_opportunity.job_title)
    expect(rendered_component).to have_css('p', text: job_opportunity.job_level)
    expect(rendered_component).to have_css('p', text: job_opportunity.place)
  end
end
