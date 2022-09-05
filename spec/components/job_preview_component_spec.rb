# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobPreviewComponent, type: :component do
  let(:job_opportunity) { create(:job_opportunity) }
  let(:rendered_component) { render_inline(described_class.new(job_opportunity: job_opportunity)).to_html }

  it 'renders the component' do
    expect(rendered_component).to have_css('.job-preview-box')
    expect(rendered_component).to have_link('Ver detalhes')
    expect(rendered_component).to have_css('h4', text: job_opportunity.job_title)
    expect(rendered_component).to have_css('p', text: job_opportunity.job_level)
    expect(rendered_component).to have_css('p', text: job_opportunity.place)
  end
end
