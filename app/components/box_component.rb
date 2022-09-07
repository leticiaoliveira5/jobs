class BoxComponent < ViewComponent::Base
  renders_one :title
  renders_one :body

  # attributes values:
  # behavior: [:collapsible, :default]
  # default: [:open, :closed]

  def initialize(behavior: :default, default: :open)
    @behavior = behavior
    @default = default
    super
  end

  def default_display
    'none' if @behavior == :collapsible && @default == :closed
  end

  def default_symbol
    @default == :open ? '-' : '+'
  end

  def collapsible?
    @behavior == :collapsible
  end
end
