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
end
