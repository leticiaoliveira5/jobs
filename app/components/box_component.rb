# frozen_string_literal: true

class BoxComponent < ViewComponent::Base
  renders_one :title
  renders_one :body

  def initialize(collapsible: false, default: nil)
    @collapsible = collapsible
    @default = default
    super
  end
end
