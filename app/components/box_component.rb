class BoxComponent < ViewComponent::Base
  renders_one :title
  renders_one :body

  # attributes values:
  # behavior: [:collapsible, :default]
  # default: [:open, :closed]
  # color: [:primary, :secondary]

  def initialize(behavior: :default, default: :open, color: :primary)
    @behavior = behavior
    @default = default
    @color = color
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

  def bg
    'var(--content_blocks_color)' if @color == :primary
    'var(--nav_background_color)' if @color == :secondary
  end
end
