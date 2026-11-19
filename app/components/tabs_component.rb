class TabsComponent < ViewComponent::Base
  def initialize(tabs: [])
    super()
    @tabs = tabs
  end
end
