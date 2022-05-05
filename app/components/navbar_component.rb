class NavbarComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
  end

  def current_employee
    @current_user.is_a?(Employee) ? @current_user : nil
  end

  def current_candidate
    @current_user.is_a?(Candidate) ? @current_user : nil
  end
end
