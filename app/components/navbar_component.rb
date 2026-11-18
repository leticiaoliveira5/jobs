class NavbarComponent < ViewComponent::Base
  renders_one :left
  renders_one :right

  def initialize(title:)
    super()
    @title = title
  end

  def collapse_id
    @collapse_id ||= "navbar-#{SecureRandom.hex(4)}"
  end
end
