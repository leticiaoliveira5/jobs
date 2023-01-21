class ListItemComponent < ViewComponent::Base
  renders_one :button

  def initialize(id: nil)
    super
    @id = id
  end
end
