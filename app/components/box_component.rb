# frozen_string_literal: true

class BoxComponent < ViewComponent::Base
  renders_one :title
  renders_one :body

  # attributes values:
  # collapsible: boolean
  # default: [:open, :closed]

  def initialize(collapsible: false, default: :open)
    @collapsible = collapsible
    @default = default
    super
  end

  def default_display
    @default == :open ? 'block' : 'none'
  end

  def default_symbol
    @default == :open ? '-' : '+'
  end
end