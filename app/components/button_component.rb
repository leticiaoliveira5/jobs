class ButtonComponent < ViewComponent::Base
  def initialize(alt: nil, title: nil, style: 'primary', disabled: false)
    super()
    @alt = alt
    @title = title
    @style = style
    @disabled = disabled
  end

  def button_classes
    base_classes = %w[py-2 px-4 rounded]
    style_classes = {
      'primary' => %w[bg-primary text-white font-bold],
      'secondary' => %w[bg-secondary text-white font-bold],
      'outline' => %w[bg-transparent text-body font-semibold border border-primary rounded]
    }[@style]
    if @disabled
      base_classes.push('opacity-50', 'cursor-not-allowed')
    else
      base_classes.push('cursor-pointer', 'hover:opacity-90')
    end
    base_classes.concat(style_classes).join(' ')
  end
end
