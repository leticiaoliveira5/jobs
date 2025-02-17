# frozen_string_literal: true

class CompanyPreviewComponent < ViewComponent::Base
  include ApplicationHelper
  include FontAwesome::Rails::IconHelper

  def initialize(title:, title_link: nil)
    super
    @title = title
    @title_link = title_link
  end
end
