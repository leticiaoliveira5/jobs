# frozen_string_literal: true

class BoxComponent < ViewComponent::Base
  renders_one :title
  renders_one :body
end
