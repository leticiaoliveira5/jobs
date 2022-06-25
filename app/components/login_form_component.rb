class LoginFormComponent < ViewComponent::Base
  # to fix error 'undefined_method: main_app'
  delegate :main_app, to: :helpers

  def initialize(user_type:)
    @user_type = user_type.to_sym
  end
end
