module JobApplicationHelper
  include Devise::Controllers::Helpers

  def job_application_status_tag(status)
    color = { declined: 'bg-danger', accepted: 'bg-success', waiting: 'bg-secondary' }
    status_class = color[status.to_sym]

    tag.span(
      t(".job_applications.status.#{status}"),
      class: "badge rounded-pill text-bg-secondary fw-medium text-lowercase #{status_class}"
    )
  end
end
