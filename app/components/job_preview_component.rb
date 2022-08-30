# frozen_string_literal: true

class JobPreviewComponent < ViewComponent::Base
  def initialize(job_opportunity:)
    super
    @job_opportunity = job_opportunity
  end
end
