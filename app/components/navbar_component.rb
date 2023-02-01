class NavbarComponent < ViewComponent::Base
  renders_one :left
  renders_one :right

  def initialize(title:)
    super
    @title = title
  end
end
