shared_examples 'controller simple get action' do |object: '', action: '', template: ''|
  it 'renders template' do
    instance = create(object.to_sym)

    get action.to_sym, params: { id: instance.id }

    expect(response).to render_template(template)
    expect(assigns(object.to_sym)).to eq instance unless action.in?(%w[index new])
  end
end

shared_examples 'candidate profile destroy', candidate_signed_in: true do |object: ''|
  it do
    instance = create(object.to_sym, candidate: candidate)

    delete :destroy, params: { id: instance.id }

    expect(response).to redirect_to(candidate_path(candidate))
    expect(candidate.send("#{object}s").count).to eq 0
  end
end

shared_examples 'candidate profile create', candidate_signed_in: true do |object: '', params: {}|
  it do
    post :create, params: params

    expect(response).to redirect_to(candidate_path(candidate))
    expect(candidate.send("#{object}s").count).to eq 1
  end
end

RSpec.shared_context 'login metadata' do
  before do |test|
    sign_in(employee) if test.metadata[:employee_signed_in]
    sign_in(candidate) if test.metadata[:candidate_signed_in]
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'login metadata', login_metadata: true
end
