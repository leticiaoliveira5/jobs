require 'rails_helper'

RSpec.describe CompanyPreviewComponent, type: :component do
  subject { described_class.new }

  let(:rendered_component) { render_inline(subject).to_html }

  it 'renders the component' do
    expect(rendered_component).to have_css('.company-preview')
  end
end
