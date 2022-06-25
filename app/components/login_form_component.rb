class LoginFormComponent < ViewComponent::Base
  # to fix error 'undefined_method: main_app'
  delegate :main_app, to: :helpers

  def initialize(resource_name:)
    super
    @resource_name = resource_name.to_sym
  end
end