class LoginComponent < ViewComponent::Base
  # to fix error 'undefined_method: main_app'
  delegate :main_app, to: :helpers
end
