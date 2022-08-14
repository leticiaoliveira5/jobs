shared_examples 'controller simple get action' do |object: '', action: '', template: ''|
  let(:instance) { create(object.to_sym) }
  before { get action.to_sym, params: { id: instance.id } }

  it { expect(response).to render_template(template) }
  it { expect(assigns(object.to_sym)).to eq instance } if action != 'index'
end
