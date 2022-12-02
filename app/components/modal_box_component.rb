# frozen_string_literal: true

class ModalBoxComponent < ViewComponent::Base
  renders_one :body

  # show_button_id: HTML element id
  def initialize(title: '', show_button_id: '', modal_id: '')
    @title = title
    @show_button_id = show_button_id
    @modal_id = modal_id
    super
  end
end
