class EmptyStateComponent < ViewComponent::Base
  def initialize(resource: nil, text: nil)
    super()
    @resource = resource
    @text = text || build_text
  end

  private

  def build_text
    if @resource && I18n.exists?(".empty_state.#{@resource}")
      I18n.t(".empty_state.#{@resource}")
    else
      I18n.t('.empty_state.default')
    end
  end
end
