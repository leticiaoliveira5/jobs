# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ModalBoxComponent, type: :component do
  let(:rendered_component) do
    render_inline(described_class.new(title: 'Title Test', modal_id: 'test_id')) do |component|
      component.with_body { 'Body Test' }
    end.to_html
  end

  it 'renders the modal with the given id' do
    expect(rendered_component).to have_css('#test_id[role="dialog"][aria-modal="true"]',
                                           visible: :all)
  end

  it 'renders the modal hidden by default' do
    expect(rendered_component).to have_css('#test_id.hidden', visible: :all)
  end

  it 'renders the title linked to the dialog through aria-labelledby' do
    expect(rendered_component).to have_css('#test_id[aria-labelledby="titletest_id"]',
                                           visible: :all)
    expect(rendered_component).to have_css('h5#titletest_id', text: 'Title Test',
                                                              visible: :all)
  end

  it 'renders the body inside the modal' do
    expect(rendered_component).to have_css('#test_id', text: 'Body Test', visible: :all)
  end

  it 'renders the backdrop hidden, tied to the modal id' do
    expect(rendered_component).to have_css('#backdroptest_id.hidden', visible: :all)
  end

  it 'renders the close button' do
    expect(rendered_component).to have_css('#test_id button[data-modal-close]', visible: :all)
  end

  it 'renders the toggle script bound to the modal and trigger ids' do
    expect(rendered_component).to include("getElementById('test_id')")
    expect(rendered_component).to include("getElementById('backdroptest_id')")
  end
end
