# frozen_string_literal: true

class CompanyPreviewComponent < ViewComponent::Base
  include ApplicationHelper
  include FontAwesome::Rails::IconHelper

  def initialize(type: :responsive, title: nil, title_link: nil)
    super
    @title = title
    @title_link = title_link
  end
end
