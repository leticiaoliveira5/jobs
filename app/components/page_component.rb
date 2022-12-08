# frozen_string_literal: true

class PageComponent < ViewComponent::Base
  renders_one :sidebar
  renders_one :main_content
end
