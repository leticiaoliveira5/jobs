class NavbarComponent < ViewComponent::Base
  renders_one :left
  renders_one :right

  def initialize(title:)
    @title = title
  end
end
